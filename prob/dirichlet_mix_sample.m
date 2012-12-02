function [ x, comp, seed ] = dirichlet_mix_sample ( comp_num, elem_num, a, ...
  comp_weight, seed )

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
%    08 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer COMP_NUM, the number of components in the Dirichlet
%    mixture density, that is, the number of distinct Dirichlet PDF's
%    that are mixed together.
%
%    Input, integer ELEM_NUM, the number of elements of an observation.
%
%    Input, real A(ELEM_NUM,COMP_NUM), the probabilities for
%    element ELEM_NUM in component COMP_NUM.
%    Each A(I,J) should be positive.
%
%    Input, real COMP_WEIGHT(COMP_NUM), the mixture weights of the densities.
%    These do not need to be normalized.  The weight of a given component is
%    the relative probability that that component will be used to generate
%    the sample.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X(ELEM_NUM), a sample of the PDF.
%
%    Output, integer COMP, the index of the component of the Dirichlet
%    mixture that was chosen to generate the sample.
%
%    Output, integer SEED, an updated seed for the random number generator.
%

%
%  Choose a particular density component COMP.
%
  [ comp, seed ] = discrete_sample ( comp_num, comp_weight, seed );
%
%  Sample the density number COMP.
%
  [ x, seed ] = dirichlet_sample ( elem_num, a(1:elem_num,comp), seed );

  return
end
