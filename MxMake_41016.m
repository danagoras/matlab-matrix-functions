function [ A ] = MxMake_41016( mx_id, n, m )

if(strcmp(mx_id, 'had'))
    A = hadamard(n);
elseif(strcmp(mx_id, 'trihad'))
    A = triu(hadamard(n));
elseif(strcmp(mx_id, 'toep'))
    A = toeplitz([4, -1, zeros(1, n-2)]);
elseif(strcmp(mx_id, 'mc'))
    for i=1:n
        for j=1:n
            if(i == j)
                A(i,j) = 1 + i;
            else
                A(i,j) = 1/(i-j)^2;
            end
        end
    end
elseif(strcmp(mx_id, 'wathen'))
    A = gallery('wathen', n, m);
elseif(strcmp(mx_id, 'CollegeMsg'))
    A = load('CollegeMsg.mat');
    A = A.Problem;
    A = A.A;
end

end

