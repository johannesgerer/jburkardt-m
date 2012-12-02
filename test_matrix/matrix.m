function A = matrix(k, n)
%MATRIX    Test Matrix Toolbox information and matrix access by number.
%          MATRIX(K, N) is the N-by-N instance of the matrix number K in
%          the Test Matrix Toolbox (including some of the matrices provided
%          with MATLAB), with all other parameters set to their default.
%          N.B. Only those matrices which take an arbitrary dimension N
%               are included (thus GALLERY is omitted, for example).
%          MATRIX(K) is a string containing the name of the K'th matrix.
%          MATRIX(0) is the number of matrices, i.e. the upper limit for K.
%          Thus to set A to each N-by-N test matrix in turn use a loop like
%                for k=1:matrix(0)
%                    A = matrix(k, N);
%                    Aname = matrix(k);   % The name of the matrix
%                end
%          MATRIX(-1) returns the version number and date of the toolbox.
%          MATRIX with no arguments lists the names of the M-files in the
%          collection.

%          References:
%          N.J. Higham. The Test Matrix Toolbox for Matlab (version 3.0),
%             Numerical Analysis Report No. 276, Manchester Centre for
%             Computational Mathematics, Manchester, England, September 1995.
%          N.J. Higham, Algorithm 694: A collection of test matrices in
%             MATLAB, ACM Trans. Math. Soft., 17 (1991), pp. 289-305.
%
%          Matrices omitted are: gallery, hadamard, hanowa, lauchli,
%          neumann, wathen, wilk.
%          Matrices provided with MATLAB that are included here: invhilb,
%          magic.

% Set up string array a few lines at a time to avoid `input buffer line
% overflow'.

matrices = '';

matrices = [matrices
'augment '; 'cauchy  '; 'chebspec'; 'chebvand';
'chow    '; 'circul  '; 'clement '; 'compan  ';
'condex  '; 'cycol   '; 'dingdong'; 'dorr    ';
'dramadah'; 'fiedler '; 'forsythe'; 'frank   ';];

matrices = [matrices
'gearm   '; 'gfpp    '; 'grcar   '; 'hilb    ';
'invhess '; 'invol   '; 'ipjfact '; 'jordbloc';
'kahan   '; 'kms     '; 'krylov  '; 'lehmer  ';
'lesp    '; 'lotkin  '; 'makejcf '; 'minij   ';];

matrices = [matrices
'moler   '; 'ohess   '; 'orthog  '; 'parter  ';
'pascal  '; 'pdtoep  '; 'pei     '; 'pentoep ';
'prolate '; 'rando   '; 'randsvd ';
'redheff '; 'riemann '; 'rschur  '; 'smoke   ';
'tridiag '; 'triw    '; 'vand    ';];

if nargin == 0

fprintf('Test matrices:                                                    \n')
fprintf('                                                                  \n')
fprintf('augment  cycol    gfpp     kahan   moler    poisson  triw         \n')
fprintf('cauchy   dingdong grcar    kms     neumann  prolate  vand         \n')
fprintf('chebspec dorr     hadamard krylov  ohess    rando    wathen       \n')
fprintf('chebvand dramadah hanowa   lauchli orthog   randsvd  wilk         \n')
fprintf('chow     fiedler  hilb     lehmer  parter   redheff               \n')
fprintf('circul   forsythe invhess  lesp    pascal   riemann               \n')
fprintf('clement  frank    invol    lotkin  pdtoep   rschur                \n')
fprintf('compan   gallery  ipjfact  makejcf pei      smoke                 \n')
fprintf('condex   gearm    jordbloc minij   pentoep  tridiag               \n')
fprintf('                                                                  \n')
fprintf('Visualization:   Decompositions:     Miscellaneous:              \n')
fprintf('                                                                 \n')
fprintf('fv               cgs      gj         bandred  matrix   show    \n')
fprintf('gersh            cholp    mgs        chop     matsignt skewpart\n')
fprintf('ps               cod      poldec     comp     pnorm    sparsify\n')
fprintf('pscont           diagpiv  signm      cond     qmult    sub     \n')
fprintf('see              ge                  cpltaxes rq       symmpart\n')
fprintf('                 gecp                dual     seqa     trap2tri\n')
fprintf('                                     eigsens  seqcheb          \n')
fprintf('                                     house    seqm             \n')
fprintf('                                     eigsens  seqcheb          \n\n')
fprintf('Direct search optimization: adsmax, mdsmax, nmsmax             \n')
fprintf('Demonstration: tmtdemo                                         \n')

elseif nargin == 1
   if k == 0
      [A, temp] = size(matrices);
   elseif k > 0
      A = matrices(k,:);
   else
      % Version number and date of collection.
%     A = 'Version 1.0, July 4 1989';
%     A = 'Version 1.1, November 15 1989';
%     A = 'Version 1.2, May 30 1990';
%     A = 'Version 1.3, November 14 1991';
%     A = 'Version 2.0, November 14 1993';
      A = 'Version 3.0, September 19 1995';
   end
else
   A = eval( [matrices(k,:) '(n)'] );
end
