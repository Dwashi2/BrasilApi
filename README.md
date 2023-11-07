# BrasilApi

Acesso programático de informações é algo fundamental na comunicação entre sistemas, mas, para nossa surpresa, uma informação tão útil e pública quanto um CEP não consegue ser acessada diretamente por um navegador por conta da API dos Correios não possuir CORS habilitado.

Dado a isso, este projeto experimental tem como objetivo centralizar e disponibilizar endpoints modernos com baixíssima latência utilizando tecnologias como Vercel Smart CDN responsável por fazer o cache das informações em atualmente 23 regiões distribuídas ao longo do mundo (incluindo Brasil). Então não importa o quão devagar for a fonte dos dados, nós queremos disponibilizá-la da forma mais rápida e moderna possível.

Documentação

Caso deseje saber mais sobre os detalhes das integrações consulte nossa documentação OpenAPI.

Como contribuir

Através do Next.js, um framework utilizado por empresas como Marvel, Twitch, Nike, Hulu, TypeForm, Nubank, Ferrari, TikTok, Square Enix, entre outras, estamos construindo a página de apresentação do projeto e, por ser um framework híbrido, ele possibilita a construção e deploy de APIs com o mínimo de configuração possível em uma infraestrutura autoescalável da Vercel, a mesma que conta com recursos sensacionais como a Vercel Smart CDN.

Caso você esteja lendo esta versão de README, você está pegando o projeto num estágio extremamente inicial, porém empolgante, pois há várias coisas a serem definidas. Então caso queira contribuir, utilize as issues para entender quais pontos ainda não foram resolvidos, conversar conosco e contribuir tanto com idéias técnicas, quanto de quais APIs podem ser criadas.

Veja mais detalhes sobre Como contribuir no arquivo CONTRIBUTING.md veja na pagina https://github.com/BrasilAPI/BrasilAPI

Termos de Uso

O BrasilAPI é uma iniciativa feita de brasileiros para brasileiros, por favor, não abuse deste serviço. Estamos em beta e ainda elaborando os Termos de Uso, mas por enquanto por favor não utilize formas automatizadas para fazer "crawling" dos dados da API. Um exemplo prático disso foi quando um dos maiores provedores de telefonia do Brasil estava validando novamente todos os CEPs (de 00000000 até 99999999) e ultrapassando em cinco vezes o limite atual da nossa conta no servidor. O volume de consultas deve ter a natureza de uma pessoa real requisitando um determinado dado. Para consultas com um alto volume automatizado forneceremos posteriormente alguma solução, como, por exemplo, permitir o download de toda a base de CEPs em uma única requisição.

https://github.com/BrasilAPI/BrasilAPI#
