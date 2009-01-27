DEFAULT_BUILDSTYLE=Deployment

CONFIGURATION?=$(DEFAULT_BUILDSTYLE)

all:
	xcodebuild -alltargets -configuration $(CONFIGURATION) build

clean:
	xcodebuild -alltargets clean

differential:
	xcodebuild -target differential -configuration $(CONFIGURATION) build

specs:
	xcodebuild -target specs -configuration $(CONFIGURATION) build