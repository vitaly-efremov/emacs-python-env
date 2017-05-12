# emacs-python-env

# My emacs configuration for Python development

## Emacs Side
Copy .emacs to ~./emacs
```
 cp .emacs ~./emacs
```

## Python Side
Install packages from requrements.txt
```
 pip install -r requrements.txt
```

## Virtual Environment
If you're using the virtual environment then copy .dir-locals.el to your project root (usually git dir) and replace *YOUR_ENV* with particular venv name. See https://github.com/porterjamesj/virtualenvwrapper.el for details.
```
  cp .dir-locals.el your/project/dir/
  vi .dir-locals.el
```

## Fonts installation
Emacs configuration can use different fonts (like Dejavu, Consolas), please install them if needed. For instance OS X install process:
```
  brew tap caskroom/fonts
  brew cask install font-dejavu-sans
  brew cask install font-consolas-for-powerline
```

## Projectile configuration
The .projectile file contains all projectile configurations, please adapt it to your project (see http://projectile.readthedocs.io/en/latest/).
```
  cp .projectile your/project/dir/
  vi .projectile
```
## Most useful hotkeys and commands
 ### Navigation
   **F8** - show/hide the directory tree (neotree - https://github.com/jaypei/emacs-neotree).
   **C-c p f** - projectile clever files search (https://github.com/bbatsov/projectile).
   **C-c cf** - yet another search - lists all files with pathes (eply).
   **C-x f** - another file search.
   **C-c p 4 f** - jump to a project's file using completion and show it in another window.
   **C-c p d** - display a list of all directories in the project.
   **C-c p f** - projectile files search (https://github.com/bbatsov/projectile)
   **C-c p s g** - run grep on the files in the project.
   **C-c p k** - kills all project buffers.

 ### Code
   **C-c e** - open ECB window with file stucture (https://www.emacswiki.org/emacs/EmacsCodeBrowser).
   **C-c d** - close ECB window.
   **Tab** - code complete.
   #### Elpy (https://elpy.readthedocs.io/en/latest/)
   **M-.** - go to definition.
   **C-c C-o** - search the buffer for a list of definitions of classes and functions.
   **M-TAB** - completion suggestions for a completion at point.
   **C-c C-s** - global grep for selected word.
   **C-c C-v** - global search for errors (flymake).
   **C-c C-d** - popup the documentation.
   **C-c C-e** - edit all occurrences of the symbol at point at once.
   **C-c C-r i** - clever import.
   **C-c C-x r (elpy-django-runserver)** - start the development server command, runserver
   
 ### Git
   **C-x g** - popup the Magit window (https://github.com/magit/magit)
      **s** - stage file/directory
      **c c** - commit
      **P u** - push
