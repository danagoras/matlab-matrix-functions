function [ x ] = SMW_solve_41016( A, b, M, P, Q, sdir )

if(strcmp(sdir, 'colwise'))
    M = diag(diag(A));
    C = A - M;
    P = C;
    
    % Evaluate Q by knowing that M + P*Q' = A
    Q = transpose(P\(A-M));
    
elseif(strcmp(sdir, 'rowwise'))
    M = diag(diag(A));
    C = A - M;
    Q = C;
    
    % Evaluate P by knowing that M + P*Q' = A
    P = transpose(Q)\(A - M);
end

% Solve for x
x = (M + P*Q.')\b;

end

