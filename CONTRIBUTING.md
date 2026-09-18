# Contributing

Contributions are welcome.

Please:

1. Keep changes compatible with Bash.
2. Preserve existing Compose/YAML formatting whenever possible.
3. Do not add dependencies unless they are necessary.
4. Never include real secrets, domains, API keys or private configuration in tests/issues.
5. Run the syntax checks before submitting a pull request:

```bash
bash -n pangolin-port
bash -n lib/pangolin-port-en
bash -n lib/pangolin-port-de
bash -n install.sh
bash -n uninstall.sh
```

For behavior changes, describe the Pangolin/Compose layout you tested against.
