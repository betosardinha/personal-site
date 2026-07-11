# Personal Site

![Site Version](https://img.shields.io/github/package-json/v/betosardinha/personal-site)
![GitHub branch status](https://img.shields.io/github/checks-status/betosardinha/personal-site/main)
![Node Version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fgithub.com%2Fbetosardinha%2Fpersonal-site%2Fraw%2Fmain%2Fpackage.json&query=%24.engines.node&logo=nodedotjs&label=Node.js&color=%235FA04E)
![TypeScript Version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fgithub.com%2Fbetosardinha%2Fpersonal-site%2Fraw%2Fmain%2Fpackage.json&query=%24.devDependencies.typescript&logo=typescript&label=TypeScript&color=%233178C6)
![SvelteKit Version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fgithub.com%2Fbetosardinha%2Fpersonal-site%2Fraw%2Fmain%2Fpackage.json&query=%24.devDependencies.@sveltejs/kit&logo=svelte&label=SvelteKit&color=%23FF3E00)
![Docker](https://img.shields.io/badge/Docker-enabled-2496ED?logo=docker)
[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg)](https://github.com/RichardLitt/standard-readme)

Personal website and digital space for experiments and projects.

## Install

The project is fully Docker friendly, and no local Node.js version or packages are required.

To build the application image, run:

```bash
docker compose build
```

You can also use the provided Makefile:

```bash
make build
```

## Usage

Run container:

```bash
make up
```

Run detached container:

```bash
make upd
```

Stop container:

```bash
make down
```

Show logs:

```bash
make logs
```

Run linter:

```bash
make lint
```

Run formatter:

```bash
make format
```

Run type and Svelte checks:

```bash
make check
```

Run all validations and formatting:

```bash
make validate
```

## Maintainers

[@betosardinha](https://github.com/betosardinha)

## Contributing

Feel free to [open an issue](https://github.com/betosardinha/personal-site/issues).

If editing the README, please follow the
[standard-readme](https://github.com/RichardLitt/standard-readme) specification.

## License

[MIT](LICENSE) 2026 © Alberto Sardinha
