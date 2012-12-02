function value = f1 ( i )

%*****************************************************************************80
%
%% F1 is the iteration function for example 1.
%
%  Discussion:
%
%    This function has two cycles:
%
%    6, 3, 1, of length 3
%    4, of length 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
  f_table = [ 6, 6, 0, 1, 4, 3, 3, 4, 0 ];

  value = f_table ( i + 1 );

  return
end
