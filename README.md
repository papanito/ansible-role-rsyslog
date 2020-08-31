# Ansible role "papanito.rsyslog" <!-- omit in toc -->

![Ansible Role](https://img.shields.io/ansible/role/46965) ![Ansible Quality Score](https://img.shields.io/ansible/quality/46965) ![Ansible Role](https://img.shields.io/ansible/role/d/46965) ![GitHub issues](https://img.shields.io/github/issues/papanito/ansible-role-rsyslog) ![GitHub pull requests](https://img.shields.io/github/issues-pr/papanito/ansible-role-rsyslog)

- [Remark](#remark)
- [Requirements](#requirements)
- [Role Variables](#role-variables)
- [Dependencies](#dependencies)
- [Testing](#testing)
- [Example Playbook](#example-playbook)
- [License](#license)

Ansible role to forward syslog to a log service like [Loggly.com](https://loggly.com) or [Logz.io](https://logz.io). The role also forwards the systemd logs to syslog. Details regarding the syslog configuration can be found here:

* [Loggly.com](https://www.loggly.com/docs/systemd-logs/)
* [Logz.io](https://app.logz.io/#/dashboard/data-sources/rsyslog-overTLS)

## Remark

This role is based on the role from [jmcvetta/ansible-loggly](https://github.com/jmcvetta/ansible-loggly)

## Requirements

Respective account for the logging service and a token

## Role Variables

There are common role variables and service specific ones. Most variables should be fine (as tested). Thus it's recommended to only define these variables

|Parameter|Description|Default Value|
|---------|-----------|-------------|
|`rsyslog_srv`|set this to use the correct service|`logz.io`|
|`rsyslog_tls`|`true` or `false` in case you want plaintext|`true`|
|`rsyslog_tag`||`syslog`|
|`rsyslog_token`|Token to authenticate against the `rsyslog_srv` - please set accordingly in your playbook|`YOUR_TOKEN_GOES_HERE`|
|`rsyslog_cert`|Name of the certificate to be used for secure connection|`rsyslog.crt`|
|`rsyslog_action_queue_file_name`|unique name prefix for spool files|`fwdRule1`|
|`rsyslog_action_queue_max_disk_space`|space limit (use as much as possible)|`1g`|
|`rsyslog_action_queue_save_on_shutdown`|save messages to disk on shutdown|`on`|
|`rsyslog_action_queue_action_type`|type of the action queue|`LinkedList`|
|`rsyslog_action_resume_retry_count`|number of retries if host is done, ,`-1` means infinite|`-1`|
|`rsyslog_additional_config`|list of additional config like `authpriv.*      /var/log/auth.log`|none|

## Dependencies

n/a

## Testing

Assumes you have Ruby and Bundler already installed.

```bash
bundle install  # Only required once
bundle exec kitchen test
```

## Example Playbook

```yml
- name: Forward server logs to rsyslog service
  hosts: "servers"
  vars:
    rsyslog_srv: logz.io
    rsyslog_tls: true
    rsyslog_tag: syslog
    rsyslog_token: xxxxxxxxxxxxxxxxxxxxxxxx

  roles:
     - papanito.rsyslog
```

## License

This is Free Software, released under the terms of the Apache v2 license.
