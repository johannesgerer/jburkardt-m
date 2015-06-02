function value = trinomial ( i, j, k )

%*****************************************************************************80
%
%% TRINOMIAL computes a trinomial coefficient.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/trinomial.m
%
%  Discussion:
%
%    The trinomial coefficient is a generalization of the binomial
%    coefficient.  It may be interpreted as the number of combinations of
%    N objects, where I objects are of type 1, J of type 2, and K of type 3.
%    and N = I + J + K.
%
%    T(I,J,K) = N! / ( I! J! K! )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, K, the factors.
%    All should be nonnegative.
%
%    Output, integer VALLUE, the trinomial coefficient.
%

%
%  Each factor must be nonnegative.
%
  if ( i < 0 || j < 0 || k < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRINOMIAL - Fatal error%\n' );
    fprintf ( 1, '  Negative factor encountered.\n' );
    error ( 'TRINOMIAL - Fatal error%' );
  end

  value = 1;

  t = 1;

  for l = 1 : i
%   value = value * t / l;
    t = t + 1;
  end

  for l = 1 : j
    value = value * t / l;
    t = t + 1;
  end

  for l = 1 : k
    value = value * t / l;
    t = t + 1;
  end
  
  return
end
