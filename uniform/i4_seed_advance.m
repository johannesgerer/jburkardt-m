function seed = i4_seed_advance ( seed )

%*****************************************************************************80
%
%% I4_SEED_ADVANCE "advances" the seed.
%
%  Discussion:
%
%    This routine implements one step of the recursion
%
%      SEED = ( 16807 * SEED ) mod ( 2^31 - 1 )
%
%    This version of the routine does not check whether the input value of
%    SEED is zero.  If the input value is zero, the output value will be zero.
%
%    If we repeatedly use the output of SEED_ADVANCE as the next input,
%    and we start with SEED = 12345, then the first few iterates are:
%
%         Input      Output
%          SEED        SEED
%
%         12345   207482415
%     207482415  1790989824
%    1790989824  2035175616
%    2035175616    77048696
%      77048696    24794531
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 May 2008
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
%    Input, integer SEED, the seed value.
%
%    Output, integer SEED, the "next" seed.
%
  i4_huge = 2147483647;

  k = floor ( seed / 127773 );

  seed = 16807 * ( seed - k * 127773 ) - k * 2836;

  if ( seed < 0 )
    seed = seed + i4_huge;
  end

  return
end
