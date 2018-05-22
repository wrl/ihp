{-# LANGUAGE TypeFamilies, DataKinds, MultiParamTypeClasses, PolyKinds, TypeApplications, ScopedTypeVariables, TypeInType, ConstraintKinds, TypeOperators, GADTs, UndecidableInstances, StandaloneDeriving, IncoherentInstances, AllowAmbiguousTypes #-}
module Foundation.HaskellSupport ((|>), isEmpty, whenEmpty, (==>), get) where

import ClassyPrelude
import Control.Monad (when)
import qualified Data.Default
import qualified Data.UUID
import Data.Proxy
import GHC.Records
import GHC.TypeLits
import GHC.OverloadedLabels

--(|>) :: a -> f -> f a
infixl 8 |>
a |> f = f a

isEmpty :: (Eq a, Monoid a) => a -> Bool
isEmpty value = value == mempty

whenEmpty condition = when (isEmpty condition)


instance Data.Default.Default Data.UUID.UUID where
    def = Data.UUID.nil

(==>) :: forall model attribute value. (KnownSymbol attribute, HasField attribute model value) => model -> Proxy attribute -> value
(==>) struct _ = getField @attribute struct

get :: forall attribute model value. (KnownSymbol attribute, HasField attribute model value) => model -> value
get model = getField @attribute model

instance {-# OVERLAPS #-} forall name. (KnownSymbol name) => IsLabel name (Proxy name) where
    fromLabel = Proxy @name
