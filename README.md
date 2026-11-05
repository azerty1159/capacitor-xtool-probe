# capacitor-xtool-probe

Teste de CI: o [xtool](https://github.com/xtool-org/xtool) (build de app iOS em Linux, sem Xcode)
consegue compilar um app **Capacitor 8**? O Capacitor é distribuído como xcframework binário
(`capacitor-swift-pm`), e há relato de falha com o motor SwiftBuild
([xtool#310](https://github.com/xtool-org/xtool/issues/310)).

App mínimo: `CAPBridgeViewController` + plugins `@capacitor/filesystem` e `@capacitor/share`,
sem storyboard e sem asset catalog. Nenhum dado real, nenhuma assinatura, nenhum login Apple.

| Teste | Job | Sucesso | Morte |
|---|---|---|---|
| T1 | Swift 6.4 (SwiftBuild) + SDK do Xcode 27.1 | `xtool dev build` gera o `.app` | "There is no XCFramework found" |
| T2 | mesmo job, `ci/check-app.sh` | frameworks, `public/`, config e plugins no `.app` | alguma checagem FALHA |
| T3 | Swift 6.3 (motor antigo) + SDK do Xcode 26 | idem T1 + T2 | idem |

O `.ipa` sem assinatura sai como artefato do run (para instalar com `xtool install`).

Rodar: push na `main` ou *Run workflow* em Actions.
