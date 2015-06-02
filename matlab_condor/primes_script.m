%
%% PRIMES_SCRIPT.M
%
fprintf ( 1, '\n' );
fprintf ( 1, 'PRIMES_SCRIPT:\n' );
fprintf ( 1, '  MATLAB version.\n' );
tic;
s4 = sum ( isprime(3:2:10^4) ) + 1
t4 = toc
%
tic;
s5 = sum ( isprime(3:2:10^5) ) + 1
t5 = toc
%
%tic;
%s6 = sum ( isprime(3:2:10^6) ) + 1
%t6 = toc
%
tic;
p4 = length ( primes(10^4) )
t4 = toc;
%
tic;
p5 = length ( primes(10^5) )
t5 = toc;
%
tic;
p6 = length ( primes(10^6) )
t6 = toc;
output = fopen ( 'primes_report.txt', 'w' );
fprintf ( output, 'There are %d prime numbers up to 10^4.\n', s4 );
fprintf ( output, 'There are %d prime numbers up to 10^5.\n', s5 );
%fprintf ( output, 'There are %d prime numbers up to 10^6.\n', s6 );
fclose ( output );
%
%  Let's find out what files exist now.
%
ls
%
%  Terminate.
%
fprintf ( 1, '\n' );
fprintf ( 1, 'PRIMES_SCRIPT:\n' );
fprintf ( 1, '  Normal end of execution.\n' );
