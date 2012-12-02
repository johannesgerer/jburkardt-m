function i4vec_print_some ( n, a, i_lo, i_hi, title )

%*****************************************************************************80
%
%% I4VEC_PRINT_SOME prints "some" of an I4VEC.
%
%  Discussion:
%
%    An I4VEC is a vector of I4 values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%
%    Input, integer A(N), the vector to be printed.
%
%    Input, integer I_LO, I_HI, the first and last indices to print.
%    The routine expects 1 <= I_LO <= I_HI <= N.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for i = max ( 1, i_lo ) : min ( n, i_hi )
    fprintf ( 1, '  %8d: %12d\n', i, a(i) );
  end

  return
end
