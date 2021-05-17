# RPM Repository

Repository Configuration
-------------------------

Create the file `/etc/yum.repos.d/wayback.repo`:

```
[wayback]
name=Wayback Repository
baseurl=https://rpm.wabarc.eu.org/x86_64/
enabled=1
gpgcheck=0
```

Then install the package:

```bash
yum install -y wayback
```

Update Repository Index
-----------------------

```bash
make build
```
