
module Bedelibry.Api where

-- 
-- In order to make this fully general, we need a way
-- to reify meriv types from a schema into Haskell types.
--

import GHC.TypeLits
import Data.Proxy

data MerivType = MerivType Symbol (Maybe Symbol)

data MerivRelation = MerivRelation Symbol [MerivType]

newtype MerivEntity (t :: MerivType) = MerivEntity Symbol

class MerivSchema (ts :: [MerivType]) (rs :: [MerivRelation]) where

class Member (t :: MerivType) (e :: MerivEntity t)

class Elem (a :: k) (as :: [k]) where

-- Note: I think I already have something similar to this
-- in the core meriv repo.
data QueryFor r (ns :: [Nat])
data QueryResult r (ns :: [Nat])

data Url
data MerivAuth
data ConnectionErr

data RelationIn rs = RelationIn {
    relation :: MerivRelation,
    withRelationIn :: forall ret. (forall r. Elem r rs => ret) -> ret
}

data TypeIn ts = TypeIn {
    typ :: MerivType,
    withTypeIn :: forall r. (forall t. Elem t ts => r) -> r
}

-- m s a Monad for every (s :: ServerToken)
-- n the "base monad"
class -- Monad (m s) => 
  MonadMerivServ m n where
    startConnection :: Url -> MerivAuth -> (forall s. m s r) -> n (Either ConnectionErr r)

class (MonadMerivServ m n, MerivSchema ts rs) => ServerConnection m n s ts rs | s -> ts, s -> rs, s -> n where
    getRelations :: m s [RelationIn rs]
    getTypes :: m s [TypeIn ts]
    getEntities :: Elem t ts => Proxy t -> m s [MerivEntity t]
    query :: Elem r rs => QueryFor r ns -> m s [QueryResult r ns]


