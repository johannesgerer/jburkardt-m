% This program compares the execution time of mgs.m to mgsfact.m
% on matrices with 200 rows and various numbers of columns ranging
% from 50 to 200 in steps of 10.
%
% The results are saved in a plot named timing.eps.
%
% Dianne O'Leary 09/2005

m = 200;
nsizes = 50:10:m;

disp('Comparing the new algorithm to the old.')
disp('Ratios of old execution times to new:')

for j=1:length(nsizes)
  n = nsizes(j)
  C = rand(m,n);
  tic
  [q,r] = mgs(C);
  t1(j) = toc;
  tic
  [q,r] = mgsfact(C);
  t2(j) = toc;
  disp(sprintf('For %d columns, ratio = %f',n,t1(j)/t2(j)))
end

semilogy(nsizes,t1,nsizes,t2)
xlabel('number of columns')
ylabel('time (sec)')
title('Times for matrices with 200 rows')
legend('Original algorithm','Modified algorithm')

print -depsc timing.eps
