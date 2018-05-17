BREW := $(shell command -v brew 2> /dev/null)
BUNDLER := $(shell command -v bundler 2> /dev/null)
COCOAPODS := $(shell command -v pod 2> /dev/null)

setup:
ifndef BREW
    $(error "Please install homebrew before running `make setup`: https://brew.sh")
endif

ifndef BUNDLER
	$(error "Please install Bundler to continue: http://bundler.io")
endif

ifndef COCOAPODS
	$(error "Please install CocoaPods to continue: https://cocoapods.org")
endif
	@echo "--------------------------------";
	@echo "";
	@echo "Installing CocoaPods 1.5.0"
	@echo "";
	@echo "--------------------------------";
	@echo "";
	bundle install
	@echo "--------------------------------";
	@echo "";
	@echo "Installing CocoaPods dev dependencies: SwiftGen, Sourcery and SwiftLint."
	@echo "";
	@echo "--------------------------------";
	bundle exec pod install

	@echo "";
	@echo "--------------------------------";
	@echo "That is all of the dependencies for Hey set up, to run the app:";
	@echo "";
	@echo " - Open Xcode, and run Hey:'$$(tput setaf 3)open Hey.xcworkspace$$(tput sgr0)'"
	@echo ""
	@echo "--------------------------------";
	@echo ""
	@echo "Please, read README!"
	@echo "Enjoy!"
	@echo "--------------------------------";