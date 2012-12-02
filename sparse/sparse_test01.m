function sparse_test01 ( )

%*****************************************************************************80
%
%% SPARSE_TEST01 demonstrates a simple use of the SPARSE matrix facility.
%
%  Discussion:
%
%    This unrealistic example sets up a tiny matrix:
%
%    11  12   0   0  15
%     0  22  23   0   0
%    31   0  33  34  35
%
%    Note that we assume here that the entire matrix is available
%    at once, so we only need a single call to SPARSE to define the matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    George Lindfield and John Penny,
%    Numerical Methods Using MATLAB,
%    Prentice Hall, 1999
%  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_TEST01:\n' );
  fprintf ( 1, '  Demonstrate the use of MATLAB''s SPARSE facility\n' );
  fprintf ( 1, '  to define a tiny sparse matrix.\n' );

  i = [  1,  1,  1,  2,  2,  3,  3,  3,  3 ];
  j = [  1,  2,  5,  2,  3,  1,  3,  4,  5 ];
  s = [ 11, 12, 15, 22, 23, 31, 33, 34, 35 ];
  m = 3;
  n = 5;
  nzmax = 9;

  a = sparse ( i, j, s, m, n, nzmax );
  
  a

  return
end
