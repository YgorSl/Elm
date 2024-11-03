module Main exposing (..)

import Html exposing (text)

-- Função simples para exemplo
increment : Int -> Int
increment n = n + 1

-- Função que recebe uma função (Int -> Int) e um número Int, aplicando a função ao número
applyFunction : (Int -> Int) -> Int -> Int
applyFunction func x = func x

-- Função de alta ordem polimórfica
applyToAll : (a -> b) -> List a -> List b
applyToAll func list = List.map func list

-- Função para duplicar um número
double : Int -> Int
double x = x * 2

-- Função para verificar se um número é par
isEven : Int -> Bool
isEven n = modBy 2 n == 0

-- Usando as funções List.map, List.filter e List.foldl
doubledList : List Int
doubledList  = List.map double [1, 2, 3, 4]
evenNumbers : List Int
evenNumbers = List.filter isEven [1, 2, 3, 4, 5]
sumList : List Int -> Int
sumList numbers = List.foldl (+) 0 numbers

-- Currying e funções parciais
add : Int -> Int -> Int
add x y = x + y

addFive : Int -> Int
addFive = add 5

-- Exemplo principal que combina todos os exemplos acima
main : Html.Html msg
main =
    let
        incrementResult = "Aplicando função 'increment' em 5: " ++ String.fromInt (applyFunction increment 5)

        doubledListResult = "\n Lista duplicada: [" ++ (String.join ", " (List.map String.fromInt doubledList)) ++ "]"

        evenNumbersResult = "\nNúmeros pares: [" ++ (String.join ", " (List.map String.fromInt evenNumbers)) ++ "]"

        sumListResult = "\nSoma da lista [1, 2, 3, 4]: " ++ String.fromInt (sumList [1, 2, 3, 4])

        addFiveResult = "\nAdicionando 5 a 10: " ++ String.fromInt (addFive 10)
    in
    text <|
        String.join "\n\n" [ incrementResult
                           , doubledListResult
                           , evenNumbersResult
                           , sumListResult
                           , addFiveResult
                           ]