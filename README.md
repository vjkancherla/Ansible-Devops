# Ansible for DevOps

A hands-on collection of Ansible tutorials that walk through the core concepts of
automation with Ansible, from your first playbook to production-grade patterns such
as roles, Galaxy, and parallel execution. Each numbered folder is a self-contained
lesson with a `playbook.yaml`, inventory, and `Notes.txt` explaining what it
demonstrates.

## Topics covered

- **Inventory & targeting** — `0005-Inventory`, `0015-AnsibleCfg-Advanced-Inventory`,
  `0021-Targetting-Specific-Servers`
- **Playbooks** — `0010-First-PlayBook`, `0030-Playbook-Apache`, `0031-Playbook-Nodejs-app`,
  `0038-Organised-Playbook`
- **Variables & Jinja2** — `0035-vars-pre_tasks-handlers`, `0036-Jinja2-Templates`,
  `0037-Variables-in-Detail`
- **Control flow** — `0039-when-changed_when-failed_when`, `0042-Tags`, `0044-Blocks`,
  `0046-Imports`, `0048-Includes`
- **Roles & Galaxy** — `0050-Roles`, `0052-First-Role`, `0056-Multiple-Roles`,
  `0058-Ansible-Galaxy`, `0060-Using-Galaxy-Roles-Example-1`
- **Parallelism & delegation** — `0017-Parallelism`, `0040-Delegate_To-Wait_For`,
  `0025-Run-adhoc-cmds-in-background`
- **Ad-hoc commands** — `0019-Using-Modules-Adhocly`, `0023-Common-Modules-Usecases`

## Tools covered

- Ansible (playbooks, roles, Galaxy, Jinja2 templating)
- Inventory management and group/variable scoping
- Local k3d pods used as target hosts for networked playbooks

## How to use

Open any numbered folder and read its `Notes.txt` for the goal, then explore the
`playbook.yaml`, `ansible.cfg`, and inventory files. Try running a playbook with:

```bash
ansible-playbook -i pods-hosts.ini playbook.yaml
```

Progress in order — `0005-Inventory` and `0010-First-PlayBook` are the best
starting points before moving on to roles and Galaxy.

## Related

- Ansible documentation: https://docs.ansible.com/
- Ansible for DevOps (O'Reilly), by Steven Adkins
