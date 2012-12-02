function a = moler2 ( )

%*****************************************************************************80
%
%% MOLER2 returns Moler's eigenvalue problem.
%
%  Discussion:
%
%    This is a 5 by 5 matrix for which the challenge is to find the EXACT
%    eigenvalues and eigenvectors.
%
%  Formula:
%
%       -9     11    -21     63    -252
%       70    -69    141   -421    1684
%     -575    575  -1149   3451  -13801
%     3891  -3891   7782 -23345   93365
%     1024  -1024   2048  -6144   24572
%
%  Properties:
%
%    A is defective.
%
%    The Jordan normal form of A has just one block, with eigenvalue
%    zero, because A**k is nonzero for K = 0, 1, 2, 3, 4, but A**5=0.
%
%    det ( A ) = 0.
%
%    TRACE(A) = 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(5,5), the matrix.
%
  a = [     -9.0,     11.0,    -21.0,     63.0,   -252.0; ...
            70.0,    -69.0,    141.0,   -421.0,   1684.0; ...
          -575.0,    575.0,  -1149.0,   3451.0, -13801.0; ...
          3891.0,  -3891.0,   7782.0, -23345.0,  93365.0; ...
          1024.0,  -1024.0,   2048.0,  -6144.0,  24572.0 ];

  return
end
