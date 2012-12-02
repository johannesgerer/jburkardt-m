function see(A, k)
%SEE    Pictures of a matrix and its (pseudo-) inverse.
%       SEE(A) displays MESH(A), MESH(PINV(A)), SEMILOGY(SVD(A),'o'),
%       and (if A is square) FV(A) in four subplot windows.
%       SEE(A, 1) plots an approximation to the pseudospectrum in the
%       third window instead of the singular values.
%       SEE(A, -1) plots only the eigenvalues in the fourth window,
%       which is much quicker than plotting the field of values.
%       If A is complex, only real parts are used for the mesh plots.
%       If A is sparse, just SPY(A) is shown.

if nargin < 2, k = 0; end
[m, n] = size(A);
square = (m == n);
clf

if issparse(A)

   spy(A);

else

   B = pinv(A);
   s = svd(A);
   zs = (s == zeros(size(s)));
   if any( zs )
      s( zs ) = [];  % Remove zero singular values for semilogy plot.
   end

   subplot(2,2,1)
   mesh(real(A)), axis('ij'),  drawnow
   subplot(2,2,2)
   mesh(real(B)), axis('ij'),  drawnow

   if k <= 0
      subplot(2,2,3)
      semilogy(s, 'og')
      hold on, semilogy(s, '-'), hold off, drawnow
      if any(zs), subplot(2,2,3), title('Zero(s) omitted'), subplot(2,2,4), end
   elseif k == 1
      subplot(2,2,3)
      ps(A);  drawnow
   end

   if square
      if k == -1
         subplot(2,2,4)
         ps(A, 0);
      else
         subplot(2,2,4)
         fv(A);
      end
   else
      if k == 0
         subplot(2,2,4)
         axis off
      else
         clf
      end
      text(0,0,'Matrix not square.')
   end
   subplot;

end
