# Conceitos Básicos de Git

Antes de começares a usar Git, é importante entender alguns conceitos fundamentais. Vamos usar analogias simples para tornar tudo mais claro!

## 🎯 O que é Git?

Git é um **sistema de controlo de versões**. Pensa nele como um "sistema de desfazer super-potente" para o teu projeto inteiro.

### Analogia: Google Docs com superpoderes

Imagina que estás a escrever um documento no Google Docs:
- Vês o histórico de revisões
- Podes voltar atrás para versões anteriores
- Vários autores podem editar ao mesmo tempo

**Git faz isto para código** (e qualquer ficheiro de texto), mas com muito mais controlo e poder!

---

## 📦 Conceitos Fundamentais

### 1. Repositório (Repository/Repo)

Um **repositório** é a pasta do teu projeto com todo o histórico de alterações.

```
📁 meu-projeto/          ← Esta é a tua pasta normal
└── 📁 .git/             ← Aqui o Git guarda todo o histórico (pasta oculta)
    ├── commits/
    ├── branches/
    └── configuração/
```

**Tipos de repositórios**:
- **Local**: No teu computador
- **Remoto**: No GitHub, GitLab, etc.

### 2. Commit

Um **commit** é como uma fotografia do teu projeto num momento específico.

**Características**:
- Tem uma mensagem descritiva ("Adicionei análise regional")
- Tem um autor e timestamp
- Tem um ID único (hash): `a3b2c1d`
- É permanente - não desaparece!

**Analogia**: Um commit é como um ponto de save num videojogo. Podes sempre voltar a esse ponto se algo correr mal.

### 3. Working Directory, Staging Area e Repository

Git tem três "zonas" onde os teus ficheiros podem estar:

```
┌─────────────────────────────────────────────────┐
│  Working Directory (Área de Trabalho)          │
│  📝 Ficheiros que estás a editar                │
│                                                  │
│  exemplo: modificaste analise.R                 │
└──────────────────┬──────────────────────────────┘
                   │ git add
                   ▼
┌─────────────────────────────────────────────────┐
│  Staging Area (Área de Preparação)             │
│  📦 Ficheiros prontos para commit               │
│                                                  │
│  exemplo: analise.R está "staged"               │
└──────────────────┬──────────────────────────────┘
                   │ git commit
                   ▼
┌─────────────────────────────────────────────────┐
│  Repository (Histórico)                         │
│  💾 Commits guardados permanentemente           │
│                                                  │
│  exemplo: commit "Adicionar análise regional"   │
└─────────────────────────────────────────────────┘
```

**Porquê ter staging area?**

Permite-te escolher **exatamente** o que queres incluir no commit:

```bash
# Fizeste alterações em 3 ficheiros:
# - analise.R (pronto)
# - visualizacao.R (ainda tem bugs)
# - README.md (atualizado)

# Só queres fazer commit dos ficheiros prontos:
git add analise.R
git add README.md
git commit -m "Adicionar análise e atualizar README"

# visualizacao.R fica de fora até estar pronto!
```

### 4. Branch

Uma **branch** é uma linha de desenvolvimento independente.

**Analogia**: Imagina que estás a escrever um livro:
- **main**: A versão oficial publicada
- **capitulo-novo**: Estás a experimentar um capítulo novo
- **revisao-gramatica**: Alguém está a corrigir erros

Podes trabalhar em cada branch sem afetar as outras!

```
main:     A---B---C---D
               \
nova-feature:   E---F---G
```

### 5. Merge

**Merge** é juntar alterações de uma branch para outra.

```
Antes do merge:
main:     A---B---C
               \
feature:        D---E

Depois do merge:
main:     A---B---C-------F
               \         /
feature:        D---E---
```

---

## 🔄 O Workflow Básico

Este é o ciclo que vais repetir constantemente:

```
1. EDITAR ficheiros
   ↓
2. git add (staging)
   ↓
3. git commit (guardar)
   ↓
4. git push (enviar para GitHub)
```

### Passo a passo detalhado

**1. Fazer alterações**
```bash
# Editas um ficheiro (exemplo: analise.R)
# O Git deteta que o ficheiro mudou
```

**2. Ver o que mudou**
```bash
git status
# Mostra:
# - Ficheiros modificados
# - Ficheiros novos
# - Ficheiros prontos para commit
```

**3. Adicionar à staging area**
```bash
git add analise.R
# ou adicionar tudo:
git add .
```

**4. Fazer commit**
```bash
git commit -m "Adicionar análise de vendas por região"
# A mensagem deve ser clara e descritiva!
```

**5. Enviar para o GitHub**
```bash
git push
# Envia os teus commits para o repositório remoto
```

---

## 📊 Estados dos Ficheiros

Um ficheiro no Git pode estar em vários estados:

```
Untracked    → Ficheiro novo que o Git ainda não conhece
  ↓ git add
Staged       → Pronto para commit
  ↓ git commit
Committed    → Guardado no histórico
  ↓ editar ficheiro
Modified     → Ficheiro mudou desde o último commit
  ↓ git add
Staged       → Pronto para novo commit
```

### Comandos para verificar estados

```bash
# Ver estado geral
git status

# Ver diferenças nos ficheiros modificados
git diff

# Ver diferenças nos ficheiros staged
git diff --staged

# Ver histórico de commits
git log
```

---

## 🎨 Boas Práticas

### Mensagens de Commit

❌ **Mau**:
```bash
git commit -m "updates"
git commit -m "fix"
git commit -m "asdfgh"
```

✅ **Bom**:
```bash
git commit -m "Adicionar análise de vendas por região"
git commit -m "Corrigir cálculo do valor total"
git commit -m "Atualizar README com instruções de instalação"
```

**Regras para boas mensagens**:
1. Usar verbo no infinitivo ("Adicionar", "Corrigir", "Atualizar")
2. Ser específico sobre o que mudou
3. Manter curto (máx. 50-60 caracteres no título)
4. Se necessário, adicionar descrição detalhada

### Quando fazer commit?

✅ **Fazer commit quando**:
- Completaste uma funcionalidade pequena
- Corrigiste um bug
- O código está a funcionar
- Fizeste alterações relacionadas (uma "unidade lógica")

❌ **NÃO fazer commit**:
- Com código que não compila/tem erros
- De ficheiros temporários ou dados sensíveis
- De muitas coisas não relacionadas ao mesmo tempo

---

## 🔍 Glossário Rápido

| Termo | Significado |
|-------|-------------|
| **Repository** | Pasta do projeto com histórico Git |
| **Commit** | Fotografia do projeto num momento |
| **Branch** | Linha de desenvolvimento paralela |
| **Merge** | Juntar branches |
| **Clone** | Copiar repositório remoto para local |
| **Push** | Enviar commits para repositório remoto |
| **Pull** | Obter commits do repositório remoto |
| **Fork** | Copiar repositório de outra pessoa |
| **Remote** | Repositório hospedado online (ex: GitHub) |
| **HEAD** | Ponteiro para o commit atual |
| **Main/Master** | Branch principal do projeto |

---

## 🧪 Testa os teus conhecimentos

Antes de avançar, verifica se percebes:

- [ ] O que é um commit?
- [ ] Qual a diferença entre working directory e staging area?
- [ ] Para que serve `git add`?
- [ ] Para que serve `git commit`?
- [ ] O que é uma branch?
- [ ] Como é que o Git é diferente de Google Docs?

---

## 🎉 Próximo passo

Agora que percebes os conceitos, vamos [fazer o teu primeiro commit](04-primeiro-commit.md)!
