function a = r8vec_insert ( n, a, pos, value )

%*****************************************************************************80
%
%% R8VEC_INSERT inserts a value into an R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the array on input.
%
%    Input, real A(N), the array.  
%
%    Input, integer POS, the position to be assigned the new entry.
%    1 <= POS <= N+1.
%
%    Input, real VALUE, the value to be inserted.
%
%    Output, real A(N+1), the array, with VALUE inserted into the POS-th position.
%
  if ( pos < 1 || n + 1 < pos )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_INSERT - Fatal error!\n' );
    fprintf ( 1, '  Illegal insertion position = %d\n', pos );
    error ( 'R8VEC_INSERT - Fatal error!' );

  else

    for i = n+1 : -1 : pos+1
      a(i) = a(i-1);
    end

    a(pos) = value;

  end

  return
end
