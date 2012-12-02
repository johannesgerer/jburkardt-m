function [ a, seed ] = r8_uniform ( b, c, seed )

%*****************************************************************************80
%
%% R8_UNIFORM returns a scaled pseudorandom R8.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paul Bratley, Bennett Fox, Linus Schrage,
%    A Guide to Simulation,
%    Second Edition,
%    Springer, 1987,
%    ISBN: 0387964673,
%    LC: QA76.9.C65.B73.
%
%    Bennett Fox,
%    Algorithm 647:
%    Implementation and Relative Efficiency of Quasirandom
%    Sequence Generators,
%    ACM Transactions on Mathematical Software,
%    Volume 12, Number 4, December 1986, pages 362-376.
%
%    Pierre L'Ecuyer,
%    Random Number Generation,
%    in Handbook of Simulation,
%    edited by Jerry Banks,
%    Wiley, 1998,
%    ISBN: 0471134031,
%    LC: T57.62.H37.
%
%    Peter Lewis, Allen Goodman, James Miller,
%    A Pseudo-Random Number Generator for the System/360,
%    IBM Systems Journal,
%    Volume 8, Number 2, 1969, pages 136-143.
%
%  Parameters:
%
%    Input, real B, C, the minimum and maximum values.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A, the randomly chosen value.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_UNIFORM - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'R8_UNIFORM - Fatal error!' );
  end
%
%  Pick T, a random number in (0,1).
%
  [ t, seed ] = r8_uniform_01 ( seed );
%
%  Set A in ( B, C ).
%
  a = ( 1.0 - t ) * b + t * c;

  return
end
