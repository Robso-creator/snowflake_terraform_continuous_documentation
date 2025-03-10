import hcl2
import pytest

TERRAFORM_FILE = 'modules/db_test/db_test.tf'


@pytest.fixture
def load_terraform():
    """Carrega e analisa o arquivo Terraform"""
    with open(TERRAFORM_FILE) as file:
        return hcl2.load(file)


def test_table_has_comment(load_terraform):
    """Verifica se todas as tabelas possuem descrição"""
    resources = load_terraform.get('resource', [])

    for resource in resources:
        if 'snowflake_table' in resource:
            for table_name, table_props in resource['snowflake_table'].items():
                assert 'comment' in table_props, f"A tabela {table_name} não possui descrição"


def test_columns_have_comment(load_terraform):
    """Verifica se todas as colunas possuem descrição"""
    resources = load_terraform.get('resource', [])

    for resource in resources:
        if 'snowflake_table' in resource:
            for table_name, table_props in resource['snowflake_table'].items():
                for column in table_props.get('column', []):
                    assert 'comment' in column, f"A coluna {column['name']} da tabela {table_name} não possui descrição"
