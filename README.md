# README

This repository contains the saltstack prototype that implements the
`roles_and_profiles` structure described in the talk [Best Practices for
Enterprise-Scale SaltStack - Trivago -
SaltConf17](https://www.youtube.com/watch?v=yWhvgLqgYR0).

For information about the current structure see
[Docs/Structure](/Docs/Structure.html).

Work on this is to add default formulas that can be reused within this format along with implementing reactors and cloud providers.
Integration with vault for secure secret storage and a boot strap for setting all this up on a salt master.

Hoping to achieve a system that can be considered infrastructure as code. Providing deployment testing for system configuration.

---

Original Source source code for the prototype can be found here:
<https://git.thaller.ws/athaller/saltstack-prototype>.

Source source code for the documentation can be found here:
<https://git.thaller.ws/athaller/saltstack-prototype_docs>.
