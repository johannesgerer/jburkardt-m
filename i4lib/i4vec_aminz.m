function aminz = i4vec_aminz ( n, a )

%*****************************************************************************80
%
%% I4VEC_AMINZ returns the smallest nonzero magnitude in an I4VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    04 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries to be checked.
%
%    Input, integer A(N), the vector to be checked.
%
%    Output, integer AMINZ, the value of the smallest nonzero magnitude.
%    If all entries are zero, AMINZ is 0.
%
  range = find ( a(1:n) ~= 0 );

  if ( isempty ( range ) )
    aminz = 0;
  else
    aminz = min ( abs ( a(range) ) );
  end

  return
end
