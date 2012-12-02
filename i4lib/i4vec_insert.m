function a = i4vec_insert ( n, a, pos, value )

%*****************************************************************************80
%
%% I4VEC_INSERT inserts a value into an I4VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the array on input.
%
%    Input, integer A(N), the array. 
%
%    Input, integer POS, the position to be assigned the new entry.
%    1 <= POS <= N+1.
%
%    Input, integer VALUE, the value to be inserted at the given position.
%
%    Output, integer A(N+1), the modified array. 
%
  if ( pos < 1 | n+1 < pos )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4VEC_INSERT - Fatal error!\n' );
    fprintf ( 1, '  Illegal insertion position = %d\n', pos );
    error ( 'I4VEC_INSERT - Fatal error!' );

  else
    
    for i = n+1 : -1 : pos+1
      a(i) = a(i-1);
    end

    a(pos) = value;

  end

  return
end
