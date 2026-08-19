#!/bin/bash
set -euo pipefail

# Garante que o marketplace "claud-agentes" (este repositório) esteja
# registrado e que o plugin "especialistas" (os nove agentes) esteja
# instalado e habilitado, escopo user, em toda sessão nova.
# Idempotente: se já estiver tudo no lugar, cada chamada é um no-op rápido.

MARKETPLACE="claud-agentes"
PLUGIN="especialistas@claud-agentes"
REPO="lcampelo11/Claud-agentes"

if ! claude plugin marketplace list 2>/dev/null | grep -q -- "${MARKETPLACE}"; then
  claude plugin marketplace add "${REPO}" >/dev/null 2>&1 || true
fi

if ! claude plugin list 2>/dev/null | grep -q -- "${PLUGIN}"; then
  claude plugin install "${PLUGIN}" -y >/dev/null 2>&1 || true
fi

exit 0
