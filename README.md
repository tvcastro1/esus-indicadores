# Extração e Análise de Dados de Indicadores e-SUS 
![Maintenance](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-no-red.svg)](https://bitbucket.org/lbesson/ansi-colors) 

## Introdução

Esse trabalho foi realizado em  2020 e 2021 no município de Lagoa Santa - MG e será compartilhado no intuito de auxiliar os demais municípios os quais usem a solução [**e-SUS APS (Sistema de Prontuário Eletrônico criado pelo Ministério da Saúde)**](https://sisaps.saude.gov.br/esus/) para que consigam realizar consultas às suas bases de dados para extrair informações dos 7 indicadores de saúde eleitos pelo Ministério da Saúde para acompanhamento. Tais indicadores são fundamentais para garantir a qualidade de saúde do município bem como para garantir o adequado financiamento da atenção primária municipal. 

 ![image](https://user-images.githubusercontent.com/100050236/156830775-c2620747-5dc5-4ab0-a296-f59bc5af8361.png)


Porém, no momento em que esse projeto foi constrúido, não havia como visualizar os dados desses indicadores atraves do próprio programa, não existia um relatório específico dentro da aplicação para visualização e acompanhamento dos indicadores de saúde exigidos pelo Ministério da Saúde. Essa foi a motivação para a análise da base de dados local do programa e a elaboração das queries SQL aqui incluídas.
 

**PS:Esse projeto não terá mais manutenção ou atualizações**
 
## Informações Importantes

• Os scripts SQL estão adaptados para rodar em um SGBD PostgreSQL, inclusive utilizando funções compatíveis apenas com PostgreSQL.

• As queries foram construídos com base em um schema de dados da versão 3.2 do e-SUS APS

• A base para a construção dessas consultas foi a análise da documentação disponível em: [Guia para Qualificação dos Indicadores da APS](http://189.28.128.100/dab/docs/portaldab/documentos/esus/qualificadores_indicador_PEC.pdf), e da documentação [Layout e-SUS AB de Dados e Interface Versão 4.0.0](https://integracao.esusab.ufsc.br/v400/)

## Sugestões de como usar o projeto

• Os dados  das consultas podem ser extraídos no formato CSV e tratados posteriormente com Excel, Power BI ou qualquer outra ferramenta para análise dos dados.

## Créditos

[Thiago Vieira de Castro](https://www.linkedin.com/in/thiago-vieira-de-castro-b9a698155/)

## Licença 

[GNU General Public License v3.0 ](https://www.gnu.org/licenses/gpl-3.0.pt-br.html)







