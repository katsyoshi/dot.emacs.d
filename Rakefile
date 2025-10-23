require 'rake'
require 'set'

ROOT = File.expand_path(__dir__)
EMACS = ENV.fetch('EMACS', 'emacs')

TARGET_FILES = %w[early-init.el init.el].freeze
LOAD_REGEX = /\(load\s+"([^"]+)"\)/.freeze
HOME_EMACS_DIR = File.expand_path('~/.emacs.d')


def normalize_load_path(path, base: ROOT)
  expanded = if path.start_with?('~/')
               File.expand_path(path)
             else
               File.expand_path(path, base)
             end

  if expanded.start_with?(HOME_EMACS_DIR)
    relative = expanded.delete_prefix(HOME_EMACS_DIR).sub(%r{^/}, '')
    expanded = File.expand_path(relative, ROOT)
  end

  expanded.end_with?('.el') ? expanded : "#{expanded}.el"
end


def gather_loaded_files(entry_points)
  seen = Set.new
  queue = entry_points.map { |file| File.expand_path(file, ROOT) }
  loaded = []

  until queue.empty?
    current = queue.shift
    next unless File.exist?(current)
    next if seen.include?(current)

    seen << current
    loaded << current

    content = File.read(current)
    content.scan(LOAD_REGEX) do |match|
      load_path = normalize_load_path(match.first, base: File.dirname(current))
      next unless load_path.start_with?(ROOT)

      queue << load_path
    end
  end

  loaded
end

namespace :emacs do
  desc 'Byte-compile Emacs Lisp sources in this configuration'
  task :bytecompile do
    forms = gather_loaded_files(TARGET_FILES).map do |path|
      "(byte-compile-file #{path.dump})"
    end

    if forms.empty?
      warn 'No byte-compile targets found; nothing to do.'
      next
    end

    lisp = "(progn #{forms.join(' ')})"

    sh EMACS,
       '--batch',
       '--quick',
       '--eval', "(setq user-emacs-directory #{("#{ROOT}/".dump)})",
       '-l', 'early-init.el',
       '-l', 'init.el',
       '--eval', lisp
  end
end

desc 'Byte-compile Emacs Lisp sources'
task bytecompile: 'emacs:bytecompile'


task default: :bytecompile
