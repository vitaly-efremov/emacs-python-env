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
If you're using the virtual environment then copy .dir-locals.el to your project root (usually git dir) and replace *YOUR_ENV* with particular venv name.
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
