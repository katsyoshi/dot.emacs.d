require 'rake'

ROOT = File.expand_path(__dir__)
EMACS = ENV.fetch('EMACS', '/usr/bin/emacs')

namespace :emacs do
  desc 'Byte-compile settings modules'
  task :bytecompile do
    settings_dir = File.join(ROOT, 'settings')
    lisp = "(byte-recompile-directory #{settings_dir.dump} 0)"

    sh EMACS,
       '--batch',
       '--quick',
       '--eval', "(setq user-emacs-directory #{("#{ROOT}/".dump)})",
       '-l', 'settings/package.el',
       '-l', 'settings/load-path.el',
       '--eval', lisp
  end
end

desc 'Byte-compile settings modules'
task bytecompile: 'emacs:bytecompile'

task default: :bytecompile
