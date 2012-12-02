function run_count = i4vec_run_count ( n, a )

%*****************************************************************************80
%
%% I4VEC_RUN_COUNT counts runs of equal values in an I4VEC.
%
%  Discussion:
%
%    An I4VEC is a vector of integer values.
%
%    A run is a sequence of equal values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, integer A(N), the vector to be examined.
%
%    Output, integer RUN_COUNT, the number of runs.
%
  run_count = 0;

  if ( n < 1 )
    return
  end

  test = 0;

  for i = 1 : n

    if ( i == 1 | a(i) ~= test )
      run_count = run_count + 1;
      test = a(i);
    end

  end

  return
end
