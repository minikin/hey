BREW := $(shell command -v brew 2> /dev/null)
COCOAPODS := $(shell command -v pod 2> /dev/null)

setup:
ifndef BREW
    $(error "Please install homebrew before running `make setup`: https://brew.sh")
endif

ifndef COCOAPODS
	$(error "Please install CocoaPods to continue: https://cocoapods.org")
endif

	@echo "Installing CocoaPods 1.5.0"
	@echo "";
	bundle install
	@echo "----------------";
	@echo "Installing CocoaPods Dependencies"
	bundle exec pod install

	@echo "";
	@echo "----------------";
	@echo "That is all of the dependencies for Hey set up, to run the app:";
	@echo "";
	@echo " - Open Xcode, and run Hey:'$$(tput setaf 3)open Hey.xcworkspace$$(tput sgr0)'"
	@echo ""
	@echo "Any other details can be found in the README."
	@echo "Enjoy!"
	@echo "----------------";