compile:
	nimble install nigui
	nimble install zippy
	nim cc -d:release NENInstallator.nim
	nim cc -d:release packer.nim
