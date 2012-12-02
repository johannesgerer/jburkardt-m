function [ comp, x, seed ] = dirichlet_mix_sample ( comp_max, comp_num, ...
  elem_num, a, comp_weight, seed )

%*****************************************************************************80
%
%% DIRICHLET_MIX_SAMPLE samples a Dirichlet mixture PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer COMP_MAX, the leading dimension of A, which must
%    be at least COMP_NUM.
%
%    Input, integer COMP_NUM, the number of components in the Dirichlet
%    mixture density, that is, the number of distinct Dirichlet PDF's
%    that are mixed together.
%
%    Input, integer ELEM_NUM, the number of elements of an observation.
%
%    Input, real A(COMP_MAX,ELEM_NUM), the probabilities for element ELEM_NUM
%    in component COMP_NUM.
%    Each A(I,J) should be greater than or equal to 0.0.
%
%    Input, integer COMP_WEIGHT(COMP_NUM), the mixture weights of the densities.
%    These do not need to be normalized.  The weight of a given component is
%    the relative probability that that component will be used to generate
%    the sample.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, integer COMP, the index of the component of the Dirichlet
%    mixture that was chosen to generate the sample.
%
%    Output, real X(ELEM_NUM), a sample of the PDF.
%

%
%  Check.
%
  for comp_i = 1 : comp_num

    for elem_i = 1 : elem_num
      if ( a(comp_i,elem_i) < 0.0 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'DIRICHLET_MIX_SAMPLE - Fatal error%\n' );
        fprintf ( 1, '  A(COMP,ELEM) < 0.\n' );
        fprintf ( 1, '  COMP = %d\n', comp_i );
        fprintf ( 1, '  ELEM = %d\n', elem_i );
        fprintf ( 1, '  A(COMP,ELEM) = %f\n', a(comp_i,elem_i) );
        error ( 'DIRICHLET_MIX_SAMPLE - Fatal error%' )
      end
    end

  end
%
%  Choose a particular density MIX.
%
  comp_weight_sum = sum ( comp_weight(1:comp_num) );

  [ r, seed ] = r8_uniform_01 ( seed );

  r = r * comp_weight_sum;
  comp = 1;
  sum2 = 0.0;

  while ( comp < comp_num )

    sum2 = sum2 + comp_weight(comp);

    if ( r <= sum2 )
      break
    end

    comp = comp + 1;

  end
%
%  Sample density COMP.
%
  for elem_i = 1 : elem_num
    [ x(elem_i), seed ] = gamma_sample ( 0.0, 1.0, a(comp,elem_i), seed );
  end
%
%  Normalize the result.
%
  x(1:elem_num) = x(1:elem_num) / sum ( x(1:elem_num) );

  return
end
