*Container* Changelog MISP-dockerized-misp-proxy
=====================================================

USING: https://releases.readthedocs.io/en/latest/usage.html


- :release:`2.4.0 <2018-09-13>`
- :release:`2.3.2 <2018-09-13>`
- :release:`2.2.3 <2018-09-13>`
- :release:`2.1.6 <2018-09-13>`
- :release:`2.0.5 <2018-09-13>`
- :feature:`1780` Add context manager behavior to `~fabric.group.Group`, to
  match the same feature in `~fabric.connection.Connection`. Feature request by
  István Sárándi.
- :feature:`1709` Add `Group.close <fabric.group.Group.close>` to allow closing
  an entire group's worth of connections at once. Patch via Johannes Löthberg.
- :bug:`-` Fix a bug preventing tab completion (using the Invoke-level
  ``--complete`` flag) from completing task names correctly (behavior was to
  act as if there were never any tasks present, even if there was a valid
  fabfile nearby).
- :bug:`1850` Skip over ``ProxyJump`` configuration directives in SSH config
  data when they would cause self-referential ``RecursionError`` (e.g. due to
  wildcard-using ``Host`` stanzas which include the jump server itself).
  Reported by Chris Adams.
- :bug:`-` Some debug logging was reusing Invoke's logger object, generating
  log messages "named" after ``invoke`` instead of ``fabric``. This has been
  fixed by using Fabric's own logger everywhere instead.
- :bug:`1852` Grant internal `~fabric.connection.Connection` objects created
  during ``ProxyJump`` based gateways/proxies a copy of the outer
  ``Connection``'s configuration object. This was not previously done, which
  among other things meant one could not fully disable SSH config file loading
  (as the internal ``Connection`` objects would revert to the default
  behavior). Thanks to Chris Adams for the report.
- :release:`2.3.1 <2018-08-08>`
- :bug:`- (2.3+)` Update the new functionality added for :issue:`1826` so it
  uses ``export``; without this, nontrivial shell invocations like ``command1
  && command2`` end up only applying the env vars to the first command.
- :release:`2.3.0 <2018-08-08>`
- :feature:`1826` Add a new Boolean configuration and
  `~fabric.connection.Connection` parameter, ``inline_ssh_env``, which (when
  set to ``True``) changes how Fabric submits shell environment variables to
  remote servers; this feature helps work around commonly restrictive
  ``AcceptEnv`` settings on SSH servers. Thanks to Massimiliano Torromeo and
  Max Arnold for the reports.