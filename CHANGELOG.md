0.1.7 / 2020-04-09
==================
merged quintush/feature/addJQSyntax, which incorporates the following changes:
- added jq syntax including test verifications (#95)
- added Helm V3 compatiblity (#87, #98)
- make install-binary.sh version aware (#97)
- added xml outputs JUnit, NUnit, XUnit and update project to use modules (#51, #78)

0.1.6 / 2020-04-03
==================
- fix testing of files in subdirectories of templates

0.1.5 / 2019-04-09
==================
- update sprig (#72, #73)

0.1.4 / 2019-03-30
==================
- fix slash problem in windows (#70)
- add update plugin hook, enable `helm plugin update` (#69)

0.1.3 / 2019-03-29
==================
- use yaml.Decoder to parse multi doc manifest (#66)
- fix doc typo (#56, #63)
- upgrade sprig and helm (#49)
- fix static linking of building (#46)
- enhance install script (#43)
- standard dockerfile for running (#42)

0.1.2 / 2018-03-29
==================
- feature: recursively find test suite files along dependencies in `charts`
- fix: absolute value file path in TestJob.Values
- doc: fix `isAPIVersion` typo
- upgrade helm to v2.8.2
- more robust tests (of the plugin)
