%% Práctica 3A. Descomposición en valores singulares (SVD)
% Alejandra Velasco Sánchez-Villares (51460400-Q)
% 
% En la Práctica 2 hemos aprendido a hacer la descomposición espectral de 
% una matriz simétrica y definida positiva. En adelante, emplearemos el comando 
% |[V,D]=eigs(A)| de MATLAB, donde |V| es la matriz cuyas columnas son autovectores 
% y |D| es una matriz diagonal de autovalores ordenados decrecientemente en valor 
% absoluto.
% 
% 1. Escribir en el Apéndice A1 una función que calcule la descomposición 
% SVD reducida de una matriz $\mathbf A \in \mathcal M_{n\times m}$, y que responda 
% a la sintaxis
% 
%     |[U,S,V]=svd_eigs(A)|
% 
% utilizando la descomposición espectral de $\mathbf A^t \mathbf A$ calculada 
% mediante el comando |eigs| de MATLAB.
% 
% 2. Probar la función sobre la matriz
% 
% $$\mathbf A =\left(\begin{array}{ccc}1 & 0 \\ 2 & 1 \\0 & 1\end{array}\right)$$
% 
% comparar con la salida del SVD de MATLAB, dado por el comando |svd|


%% 
% *Solución:* En la salida de MATLAB la matriz U tiene una columna más, 
% porque calcula una base completa del espacio de llegada, y no sólo la base reducida 
% la reducida. La matriz S tiene una fila más llena de 0s, para que las matrices 
% se puedan multiplicar.
% 
% 3. Probar la función sobre la matriz
% 
% $$\mathbf A =\left(\begin{array}{ccc}1 & 2 & 0 \\ 0 & 1 & 1\end{array}\right)$$


%% 
% 4. Probar la función sobre la matriz
% 
% $$\mathbf A =\left(\begin{array}{ccc}1 & 2 & 0 \\ 0 & 1 & 1 \\ 0 & 0 & 
% 0\end{array}\right)$$
% 
% ¿Cuáles son las dimensiones de las matrices obtenidas? ¿Por qué?


%% 
% La matriz U es 3 x 2, S es 2 x 2 y V es 3 x 2. Esto ocurre porque la matriz 
% no es de rango máximo y estamos calculando la factorización SVD reducida.
%% Apéndice A
% A1. Descomposición SVD

function [U,S,V] = svd_eigs(A)
    [n m] = size(A);
    [V, D] = eigs(A'*A);
    U = zeros(n,m);
    r = 1;
    epsilon = 0.0001;
    while D(min(r,m),D(min(r,m))) > epsilon && r<=m
        r = r+1;
    end
    for k = 1:r
        U(:,k)= A * V(:,k) / D(k,k);
    end
    V = 
end