require 'rake'
require 'fileutils'

ROOT = File.expand_path(__dir__)
EMACS = ENV.fetch('EMACS', '/usr/bin/emacs')
PACKAGE_MANIFEST = File.join(ROOT, 'packages.txt')

def env_paths(name, default)
  ENV.fetch(name, default)
     .split(File::PATH_SEPARATOR)
     .reject(&:empty?)
     .map { |path| File.expand_path(path) }
end

def excluded_repo_index_path?(path, excludes)
  path = File.join(File.expand_path(path), '')
  excludes.any? do |exclude|
    path.start_with?(File.join(exclude, ''))
  end
end

def collect_repo_index(root, depth, excludes, repos)
  root = File.expand_path(root)
  return if excluded_repo_index_path?(root, excludes)
  return unless File.directory?(root)

  if File.readable?(File.join(root, '.git'))
    repos << File.join(root, '')
    return
  end

  return if depth <= 0

  Dir.children(root).sort.each do |entry|
    path = File.join(root, entry)
    next if File.symlink?(path)
    next unless File.directory?(path)

    collect_repo_index(path, depth - 1, excludes, repos)
  rescue SystemCallError
    next
  end
rescue SystemCallError
  nil
end

def emacs_package_setup
  <<~ELISP
    (progn
      (require 'package)
      (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
      (fset 'package-desc-vers 'package--ac-desc-version)
      (package-initialize))
  ELISP
end

def package_names
  File.readlines(PACKAGE_MANIFEST, chomp: true)
      .map { |line| line.sub(/#.*/, '').strip }
      .reject(&:empty?)
      .uniq
end

def add_package_to_manifest(name)
  return false if package_names.include?(name)

  content = File.read(PACKAGE_MANIFEST)
  content = "#{content}\n" unless content.end_with?("\n")
  tmp = "#{PACKAGE_MANIFEST}.#{$$}.tmp"
  File.write(tmp, "#{content}#{name}\n")
  FileUtils.mv(tmp, PACKAGE_MANIFEST)
  true
end

desc 'Byte-compile settings modules'
task :bytecompile do
  settings_dir = File.join(ROOT, 'settings')
  lisp = "(byte-recompile-directory #{settings_dir.dump} 0)"

  sh EMACS,
     '--batch',
     '--quick',
     '--eval', "(setq user-emacs-directory #{("#{ROOT}/".dump)})",
     '--eval', emacs_package_setup,
     '-l', 'settings/load-path.el',
     '--eval', lisp
end

namespace :package do
  desc 'Install a package and add it to packages.txt'
  task :add, [:name] do |_task, args|
    name = args[:name] || ENV['PACKAGE']
    unless name&.match?(/\A[[:alnum:]+_-]+\z/)
      abort "Usage: rake 'package:add[NAME]'"
    end

    lisp = <<~ELISP
      (progn
        (package-refresh-contents)
        (let ((package (intern #{name.dump})))
          (unless (package-installed-p package)
            (package-install package t))))
    ELISP

    sh EMACS,
       '--batch',
       '--quick',
       '--eval', "(setq user-emacs-directory #{("#{ROOT}/".dump)})",
       '--eval', emacs_package_setup,
       '--eval', lisp

    if add_package_to_manifest(name)
      puts "Added #{name} to #{PACKAGE_MANIFEST}"
    else
      puts "#{name} is already in #{PACKAGE_MANIFEST}"
    end
  end

  desc 'Refresh archives and install missing Emacs packages'
  task :install do
    packages = package_names.map(&:dump).join(' ')
    lisp = <<~ELISP
      (progn
        (package-refresh-contents)
        (dolist (name '(#{packages}))
          (let ((package (intern name)))
            (unless (package-installed-p package)
              (package-install package t)))))
    ELISP

    sh EMACS,
       '--batch',
       '--quick',
       '--eval', "(setq user-emacs-directory #{("#{ROOT}/".dump)})",
       '--eval', emacs_package_setup,
       '--eval', lisp
  end
end

namespace :repo do
  desc 'Build repository index cache'
  task :index do
    roots = env_paths('REPO_INDEX_ROOTS', '~/Program')
    excludes = env_paths('REPO_INDEX_EXCLUDES', '~/Program/Gems')
    output = File.expand_path(ENV.fetch('REPO_INDEX_OUTPUT', '~/.cache/repo-index/repos'))
    depth = Integer(ENV.fetch('REPO_INDEX_DEPTH', '5'))
    repos = []

    roots.each do |root|
      collect_repo_index(root, depth, excludes, repos)
    end

    FileUtils.mkdir_p(File.dirname(output))
    tmp = "#{output}.#{$$}.tmp"
    File.write(tmp, repos.uniq.sort.join("\n") + "\n")
    FileUtils.mv(tmp, output)

    puts "Wrote #{repos.uniq.size} repositories to #{output}"
  end
end

task default: 'repo:index'
