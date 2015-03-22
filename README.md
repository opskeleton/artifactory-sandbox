# Intro 
This project manages a sandbox for [artifactory](http://www.jfrog.com/open-source/).

# Usage
In order to setup the oss version:

```bash
  $ bundle install 
  $ librarian-puppet install 
  $ vagrant up oss
```

In order to setup pro:
```bash
  $ bundle install 
  $ librarian-puppet install 
  # make sure to have artifactory pro downloaded first:
  $ md5sum artifactory-powerpack-standalone-3.5.3.zip
  1fe03ce5b7d846f66f05c41d006a2d6a  artifactory-powerpack-standalone-3.5.3.zip
  $ vagrant up pro
```

# Copyright and license

Copyright [2014] [Ronen Narkis]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.

You may obtain a copy of the License at:

  [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
