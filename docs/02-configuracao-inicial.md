# Configuração Inicial do Git

Agora que tens o Git instalado, precisas de o configurar com a tua informação pessoal. Isto é importante porque cada alteração que fizeres ficará associada ao teu nome.

## 🎯 O que vamos fazer

1. Configurar o teu nome e email no Git
2. Verificar a configuração
3. Configurar autenticação com o GitHub
4. (Opcional) Configurar o editor padrão

---

## 1️⃣ Configurar nome e email

O Git precisa de saber quem és. Esta informação aparecerá em todos os teus commits.

### Abre o terminal

- **Windows**: Git Bash (instalado com o Git) ou Command Prompt
- **macOS/Linux**: Terminal
- **Positron**: Podes usar o terminal integrado (View → Terminal)

### Configura o teu nome

```bash
git config --global user.name "O Teu Nome"
```

**Exemplo**:
```bash
git config --global user.name "Maria Silva"
```

**Importante**: Usa o teu nome real, não um nickname! Isto vai aparecer no histórico profissional.

### Configura o teu email

```bash
git config --global user.email "teu.email@datah.pt"
```

**Exemplo**:
```bash
git config --global user.email "maria.silva@datah.pt"
```

**⚠️ Importante**:
- Usa o mesmo email que usaste para criar a conta no GitHub
- Este email ficará visível nos teus commits públicos
- Se quiseres privacidade, podes usar o email noreply do GitHub (vê no final desta página)

---

## 2️⃣ Verificar a configuração

Para confirmar que tudo ficou bem configurado:

```bash
git config --global --list
```

Deves ver algo parecido com:

```
user.name=Maria Silva
user.email=maria.silva@datah.pt
```

Também podes verificar individualmente:

```bash
git config user.name
git config user.email
```

---

## 3️⃣ Autenticação com o GitHub

Para fazeres push e pull de código para o GitHub, precisas de te autenticar. Há duas formas principais:

### Opção A: GitHub CLI (Recomendado - mais fácil!)

O GitHub CLI torna a autenticação muito mais simples.

**Instalar o GitHub CLI**:

- **Windows**: Descarrega de [cli.github.com](https://cli.github.com)
- **macOS**: `brew install gh`
- **Linux**: [Instruções aqui](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)

**Autenticar**:

```bash
gh auth login
```

Segue as instruções no ecrã:
1. Escolhe "GitHub.com"
2. Escolhe "HTTPS"
3. Escolhe "Login with a web browser"
4. Copia o código que aparece
5. Pressiona Enter para abrir o browser
6. Cola o código e autoriza

✅ Está feito! Agora podes fazer push/pull sem problemas.

### Opção B: Personal Access Token (Alternativa)

Se não quiseres usar o GitHub CLI:

1. Vai a [github.com/settings/tokens](https://github.com/settings/tokens)
2. Clica em "Generate new token (classic)"
3. Dá um nome (ex: "Positron no meu laptop")
4. Seleciona as permissões: `repo`, `workflow`
5. Clica em "Generate token"
6. **IMPORTANTE**: Copia o token agora! Não vais poder vê-lo outra vez
7. Quando o Git pedir password, usa o token em vez da password

**Dica**: Guarda o token num gestor de passwords (1Password, Bitwarden, etc.)

---

## 4️⃣ (Opcional) Configurar editor padrão

Por vezes o Git abre um editor para escrever mensagens de commit. Podes definir qual:

**Para VS Code / Positron**:
```bash
git config --global core.editor "code --wait"
```

**Para nano (simples, terminal)**:
```bash
git config --global core.editor "nano"
```

**Para vim** (se gostas de desafios 😄):
```bash
git config --global core.editor "vim"
```

**Nota**: Para a maior parte dos exercícios neste tutorial, vais escrever mensagens diretamente nos comandos, por isso isto é opcional.

---

## 5️⃣ Outras configurações úteis

### Cores no terminal
Torna o output do Git mais legível:

```bash
git config --global color.ui auto
```

### Nome da branch padrão
Muitos projetos usam `main` em vez de `master`:

```bash
git config --global init.defaultBranch main
```

### Guardar credenciais
Para não teres de autenticar sempre:

**macOS**:
```bash
git config --global credential.helper osxkeychain
```

**Windows**:
```bash
git config --global credential.helper manager
```

**Linux**:
```bash
git config --global credential.helper cache
```

---

## 🔒 Privacidade: Usar email noreply do GitHub

Se não queres que o teu email pessoal apareça publicamente:

1. Vai a [github.com/settings/emails](https://github.com/settings/emails)
2. Ativa "Keep my email addresses private"
3. Copia o email no formato: `username@users.noreply.github.com`
4. Configura o Git com esse email:

```bash
git config --global user.email "username@users.noreply.github.com"
```

---

## ✅ Checklist de configuração

Confirma que tens tudo configurado:

- [ ] Nome configurado (`git config user.name`)
- [ ] Email configurado (`git config user.email`)
- [ ] Autenticação com GitHub funcional (GitHub CLI ou PAT)
- [ ] (Opcional) Editor padrão configurado
- [ ] (Opcional) Cores ativadas
- [ ] (Opcional) Branch padrão = main

---

## 🧪 Testar a configuração

Vamos criar um repositório de teste para confirmar que está tudo a funcionar:

```bash
# Criar pasta de teste
mkdir git-teste
cd git-teste

# Inicializar Git
git init

# Criar um ficheiro
echo "# Teste" > README.md

# Fazer commit
git add README.md
git commit -m "Primeiro commit de teste"
```

Se vires uma mensagem como:
```
[main abc123] Primeiro commit de teste
 1 file changed, 1 insertion(+)
```

✅ **Tudo está a funcionar!** Podes apagar a pasta de teste:

```bash
cd ..
rm -rf git-teste
```

---

## 🆘 Problemas comuns

### "Author identity unknown"
- Verifica se configuraste `user.name` e `user.email`
- Usa `git config --global --list` para confirmar

### Erro ao fazer push para o GitHub
- Confirma que te autenticaste (GitHub CLI ou PAT)
- Verifica se o token/credenciais ainda são válidos

### Git não guarda as credenciais
- Configura o credential helper (secção 5)

---

## 🎉 Próximo passo

Configuração feita! Agora vamos aprender os [conceitos básicos do Git](03-conceitos-basicos.md) antes de começarmos a trabalhar.
