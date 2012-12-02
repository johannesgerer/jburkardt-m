function a = harman ( )

%*****************************************************************************80
%
%% HARMAN returns the Harman matrix.
%
%  Formula:
%
%   1.00  0.85  0.81  0.86  0.47  0.40  0.30  0.38
%   0.85  1.00  0.88  0.83  0.38  0.33  0.28  0.41
%   0.81  0.88  1.00  0.80  0.38  0.32  0.24  0.34
%   0.86  0.83  0.80  1.00  0.44  0.33  0.33  0.36
%   0.47  0.38  0.38  0.44  1.00  0.76  0.73  0.63
%   0.40  0.33  0.32  0.33  0.76  1.00  0.58  0.58
%   0.30  0.28  0.24  0.33  0.73  0.58  1.00  0.54
%   0.38  0.41  0.34  0.36  0.63  0.58  0.54  1.00
%
%  Properties:
%
%    A is symmetric.
%
%    A is a correlation matrix for 8 physical variables measured
%    for 305 girls.
%
%    The rows and columns of the matrix correspond to the variables
%    1) height
%    2) arm span
%    3) length of forearm
%    4) length of lower leg
%    5) weight
%    6) bitrochanteric diameter
%    7) chest girth
%    8) chest width
%
%    The largest two eigenvalues are 
%
%      LAMBDA(1) = 4.67 
%
%    with eigenvector
%
%      V(1) = 0.40, 0.39, 0.38, 0.39, 0.35, 0.31, 0.29, 0.31
%
%    and 
%
%      LAMBDA(2)= 1.77
%
%    with eigevector
%
%      V(2) = 0.28 0.33 0.34 0.30 -0.39, -0.40 -0.44 -0.31
%
%    The best rank 2 approximation to the matrix, in the least squares
%    sense, is
%
%      [ V(1) V(2) ] * Diag ( LAMBDA(1), LAMBDA(2) ) * [ V(1) V(2) ]'
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    HH Harman,
%    Modern Factor Analysis,
%    The University of Chicago Press, 1960.
%
%    Lawrence Huber, Jacqueline Meulman, Willem Heiser,
%    Two Purposes for Matrix Factorization: A Historical Appraisal,
%    SIAM Review, Volume 41 : number 1, pages 68-82.
%
%  Parameters:
%
%    Output, real A(8,8), the matrix.
%
  a = [ ...
    1.00, 0.85, 0.81, 0.86, 0.47, 0.40, 0.30, 0.38; ...
    0.85, 1.00, 0.88, 0.83, 0.38, 0.33, 0.28, 0.41; ...
    0.81, 0.88, 1.00, 0.80, 0.38, 0.32, 0.24, 0.34; ...
    0.86, 0.83, 0.80, 1.00, 0.44, 0.33, 0.33, 0.36; ...
    0.47, 0.38, 0.38, 0.44, 1.00, 0.76, 0.73, 0.63; ...
    0.40, 0.33, 0.32, 0.33, 0.76, 1.00, 0.58, 0.58; ...
    0.30, 0.28, 0.24, 0.33, 0.73, 0.58, 1.00, 0.54; ...
    0.38, 0.41, 0.34, 0.36, 0.63, 0.58, 0.54, 1.00 ];

  return
end
