# snowflake_terraform_continuous_documentation

Repositório modelo para aplicação de Continuos Documentation ao Snowflake utilizando Terraform.

O mais importante desse repositório é o fluxo de CI/CD que roda os testes e impede o merge de PRs inconsistentes

## O que é Continuos Documentation?
A documentação contínua é uma abordagem que integra a documentação ao ciclo de desenvolvimento, garantindo que ela seja
criada e atualizada simultaneamente às mudanças no código ou na infraestrutura. Diferente da documentação tradicional,
que muitas vezes é tratada como um processo separado e posterior ao desenvolvimento, a documentação contínua é parte
integrante do fluxo de trabalho.

Para ambientes de dados modernos, especialmente aqueles que utilizam Snowflake e Terraform, a documentação contínua oferece benefícios cruciais:
- Redução do débito técnico: a documentação nunca fica desatualizada porque é atualizada automaticamente junto com as mudanças de código
- Maior colaboração: equipes diferentes conseguem entender rapidamente o funcionamento dos recursos sem depender de conhecimento tribal
- Aceleração da integração: novos membros da equipe conseguem compreender a arquitetura mais rapidamente
- Melhor governança: facilita auditorias e processos de compliance com documentação sempre precisa e atualizada

Quando aplicada ao Snowflake e Terraform, a documentação contínua permite que as equipes mantenham um registro claro e
preciso de todos os objetos de banco de dados, permissões, recursos de infraestrutura e suas configurações,
sem esforço manual adicional.

## Setup

Crie um arquivo .env com o seguinte conteúdo _(lembre-se de alterar os valores)_:

```env
    TF_VAR_organization_name=organization_name
    TF_VAR_account_name=account_name
    TF_VAR_user=user
    TF_VAR_password=password
```

Depois, use este comando no terminal para carregar as variáveis antes de rodar o Terraform:
```bash
export $(grep -v '^#' .env | xargs)
```

> **Explicação:**
>    - **grep -v '^#' .env** → Remove linhas comentadas.
>    - **xargs** → Converte o conteúdo do .env em variáveis de ambiente.
>    - **export** → Define as variáveis de ambiente para a sessão atual.

Por fim, execute o comando:
```bash
terraform init
```

## Rodar testes
<sub>Só existe um teste que roda especificamente para a tabela `tb_test.tf`</sub>

Use este comando no terminal para executar os testes:

```bash
pytest
```

## Workflows

Existem dois worflows atualmente:
- Um executa os teste pre-merge, se quebrarem, nao permite o merge
- O outro, aplica as mudanças do Terraform no Snowflake

Para executar o segundo, é necessário a seguinte configuração:

Após `fork` do projeto:

1. Acesse a aba **Settings** (Configurações).
2. Clique em **Secrets and variables > Actions**.
3. Adicione os segredos correspondentes às variáveis do Snowflake:
   - `ORGANIZATION_NAME`
   - `ACCOUNT_NAME`
   - `USER`
   - `PASSWORD`
