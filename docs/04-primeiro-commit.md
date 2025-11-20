# O Teu Primeiro Commit

Agora vamos pôr as mãos na massa! Neste exercício, vais fazer fork deste repositório, criar o teu primeiro commit e enviá-lo para o GitHub.

## 🎯 Objetivos

Ao fim deste exercício, vais saber:
- Fazer fork de um repositório no GitHub
- Clonar um repositório para o teu computador
- Fazer alterações e criar um commit
- Enviar o commit para o GitHub

---

## 📋 Pré-requisitos

Antes de começar, confirma que:
- [X] Tens o Git instalado e configurado
- [X] Tens uma conta no GitHub
- [X] Tens o Positron instalado
- [X] Fizeste a [configuração inicial](02-configuracao-inicial.md)

---

## Passo 1: Fazer Fork do Repositório

O fork cria uma cópia deste repositório na tua conta do GitHub.

1. **Vai ao repositório original** (se ainda não estás lá):
   - [github.com/ruimgbarros/r-github-tutorial](https://github.com/ruimgbarros/r-github-tutorial)

2. **Clica no botão "Fork"** (canto superior direito)
   - Perto das estrelas (⭐ Star)

3. **Configura o fork**:
   - Owner: A tua conta
   - Repository name: `r-github-tutorial` (pode manter)
   - Description: (opcional)
   - ✅ "Copy the main branch only"

4. **Clica em "Create fork"**

✅ Agora tens uma cópia pessoal em `github.com/TEU-USERNAME/r-github-tutorial`

---

## Passo 2: Clonar o Repositório

Vamos trazer o repositório do GitHub para o teu computador.

### Opção A: Usar o Positron (Recomendado)

1. **Abre o Positron**

2. **File → New Project**

3. **Version Control → Git**

4. **Preenche os campos**:
   ```
   Repository URL: https://github.com/TEU-USERNAME/r-github-tutorial.git
   Project directory name: r-github-tutorial
   Create project as subdirectory of: (escolhe uma pasta)
   ```

   ⚠️ **Importante**: Substitui `TEU-USERNAME` pelo teu username do GitHub!

5. **Clica "Create Project"**

6. **Aguarda** enquanto o Positron clona o repositório

✅ O projeto está agora aberto no Positron com integração Git ativa!

### Opção B: Usar o Terminal

Se preferires usar o terminal:

```bash
# Navega para onde queres guardar o projeto
cd ~/Projects

# Clona o repositório
git clone https://github.com/TEU-USERNAME/r-github-tutorial.git

# Entra na pasta
cd r-github-tutorial

# Abre no Positron
# (ou abre manualmente: File → Open Project)
```

---

## Passo 3: Explorar o Repositório

Antes de fazer alterações, explora o que está no repositório:

1. **No Positron, vê os ficheiros**:
   - Painel Files (normalmente à direita)
   - Explora as pastas `data/`, `scripts/`, `docs/`

2. **Abre o ficheiro** `scripts/01-importar-dados.R`

3. **Executa o script** para confirmar que funciona:
   ```r
   source("scripts/01-importar-dados.R")
   ```

4. **Vê o estado do Git**:
   - No Positron: Painel "Git" (aba ao lado de "Environment")
   - Ou no terminal:
     ```bash
     git status
     ```

   Deve dizer: `nothing to commit, working tree clean`

---

## Passo 4: Fazer uma Alteração

Vamos fazer uma alteração simples para o teu primeiro commit.

### Tarefa: Adicionar o teu nome ao README

1. **Abre o ficheiro** `README.md`

2. **No final do ficheiro**, antes da última linha, adiciona:

   ```markdown
   ## 👥 Participantes

   - [O TEU NOME] - Completei o tutorial!
   ```

3. **Guarda o ficheiro** (Ctrl+S ou Cmd+S)

---

## Passo 5: Ver as Alterações

Agora vamos ver o que mudou.

### No Positron (Interface Visual)

1. **Abre o painel Git**:
   - Vai a View → Git (se não estiver visível)

2. **Vê o ficheiro modificado**:
   - `README.md` aparece com um **M** (Modified)

3. **Clica no ficheiro** para ver o diff (diferenças):
   - Linhas removidas: vermelho com `-`
   - Linhas adicionadas: verde com `+`

### No Terminal (Linha de Comandos)

```bash
# Ver ficheiros alterados
git status

# Ver exatamente o que mudou
git diff
```

**Output esperado**:
```diff
+ ## 👥 Participantes
+
+ - Maria Silva - Completei o tutorial!
```

---

## Passo 6: Adicionar à Staging Area

Agora vamos preparar as alterações para o commit.

### No Positron

1. **No painel Git**, encontra `README.md`

2. **Clica na checkbox** ao lado do ficheiro
   - Ou clica no botão "Stage" (ícone +)

3. **O ficheiro move-se** para "Staged changes"

### No Terminal

```bash
git add README.md

# Confirmar que está staged:
git status
```

**Output esperado**:
```
Changes to be committed:
  modified:   README.md
```

---

## Passo 7: Fazer o Commit

Agora vamos criar o commit com uma mensagem descritiva.

### No Positron

1. **No painel Git**, encontra a caixa "Commit message"

2. **Escreve a mensagem**:
   ```
   Adicionar o meu nome à lista de participantes
   ```

3. **Clica em "Commit"**

4. **Confirma**: Vês uma mensagem de sucesso com o hash do commit

### No Terminal

```bash
git commit -m "Adicionar o meu nome à lista de participantes"
```

**Output esperado**:
```
[main a3b2c1d] Adicionar o meu nome à lista de participantes
 1 file changed, 3 insertions(+)
```

✅ **Parabéns!** Criaste o teu primeiro commit!

---

## Passo 8: Ver o Histórico

Vamos ver o commit que acabaste de criar.

### No Positron

1. **No painel Git**, clica em "History" ou ícone do relógio

2. **Vê a lista de commits**:
   - O teu commit está no topo
   - Podes clicar para ver detalhes

### No Terminal

```bash
# Ver histórico completo
git log

# Ver histórico resumido (mais legível)
git log --oneline

# Ver últimos 5 commits
git log -5
```

**Output esperado**:
```
a3b2c1d (HEAD -> main) Adicionar o meu nome à lista de participantes
b2c1d3e (origin/main) Initial commit
...
```

**Notas sobre o output**:
- `a3b2c1d`: Hash do commit (ID único)
- `HEAD -> main`: Estás atualmente neste commit, na branch main
- `origin/main`: Onde está a branch main no GitHub (ainda não fizeste push!)

---

## Passo 9: Enviar para o GitHub (Push)

Finalmente, vamos enviar o commit para o GitHub.

### No Positron

1. **No painel Git**, clica no botão **"Push"** (seta para cima ↑)

2. **Se pedido, autentica** com GitHub

3. **Aguarda** a confirmação de sucesso

### No Terminal

```bash
git push
```

**Output esperado**:
```
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Writing objects: 100% (3/3), 320 bytes | 320.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/TEU-USERNAME/r-github-tutorial.git
   b2c1d3e..a3b2c1d  main -> main
```

---

## Passo 10: Verificar no GitHub

Vamos confirmar que o commit chegou ao GitHub!

1. **Vai ao teu repositório** no browser:
   - `https://github.com/TEU-USERNAME/r-github-tutorial`

2. **Verifica o README.md**:
   - Deve mostrar o teu nome na lista de participantes

3. **Vê o histórico de commits**:
   - Clica em "X commits" (perto do topo)
   - Vês o teu commit listado!

4. **Clica no commit** para ver detalhes:
   - Vês exatamente o que mudou (diff)
   - Autor, data, hash

✅ **Sucesso!** O teu primeiro commit está no GitHub!

---

## 🎓 O Que Aprendeste

Neste exercício, fizeste:

- ✅ **Fork** de um repositório
- ✅ **Clone** para o teu computador
- ✅ **Edição** de um ficheiro
- ✅ **git add** (staging)
- ✅ **git commit** (criar commit)
- ✅ **git push** (enviar para GitHub)
- ✅ **git log** (ver histórico)

---

## 🧪 Desafio Extra

Agora que já fizeste o primeiro commit, tenta fazer outro:

1. Abre `scripts/01-importar-dados.R`
2. Adiciona um comentário no topo com o teu nome como autor:
   ```r
   # Autor: [O TEU NOME]
   ```
3. Faz commit com mensagem: `"Adicionar autoria ao script de importação"`
4. Faz push para o GitHub
5. Confirma no GitHub que ambos os commits estão lá

---

## 🆘 Problemas Comuns

### Erro ao fazer push: "remote rejected"

**Causa**: Alguém fez alterações no GitHub que tu não tens localmente.

**Solução**:
```bash
git pull
git push
```

### Erro: "Please configure your name and email"

**Causa**: Não fizeste a configuração inicial.

**Solução**: Volta ao [guia de configuração](02-configuracao-inicial.md)

### Não consigo fazer push - pede password

**Causa**: Não configuraste autenticação.

**Solução**: Usa GitHub CLI ou Personal Access Token (ver configuração inicial)

### Fiz commit de ficheiro errado

**Solução**: Se ainda não fizeste push:
```bash
# Desfazer último commit (mantém alterações)
git reset --soft HEAD~1

# Agora adiciona só o ficheiro certo
git add ficheiro-certo.R
git commit -m "Mensagem correta"
```

---

## 📊 Checklist de Sucesso

Antes de avançar, confirma que consegues:

- [ ] Fazer fork de um repositório
- [ ] Clonar um repositório
- [ ] Ver o estado com `git status`
- [ ] Ver diferenças com `git diff`
- [ ] Adicionar ficheiros com `git add`
- [ ] Criar commits com `git commit`
- [ ] Ver histórico com `git log`
- [ ] Enviar para GitHub com `git push`
- [ ] Ver commits no GitHub

---

## 🎉 Próximo Passo

Ótimo trabalho! Agora que sabes fazer commits, vamos aprender sobre [Push e Pull](05-push-pull.md) em mais detalhe.
