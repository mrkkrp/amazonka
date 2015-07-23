{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.CodePipeline.AcknowledgeJob
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Returns information about a specified job and whether that job has been
-- received by the job worker. Only used for custom actions.
--
-- <http://docs.aws.amazon.com/codepipeline/latest/APIReference/API_AcknowledgeJob.html>
module Network.AWS.CodePipeline.AcknowledgeJob
    (
    -- * Request
      AcknowledgeJob
    -- ** Request constructor
    , acknowledgeJob
    -- ** Request lenses
    , ajrqJobId
    , ajrqNonce

    -- * Response
    , AcknowledgeJobResponse
    -- ** Response constructor
    , acknowledgeJobResponse
    -- ** Response lenses
    , ajrsStatus
    ) where

import           Network.AWS.CodePipeline.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Represents the input of an acknowledge job action.
--
-- /See:/ 'acknowledgeJob' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ajrqJobId'
--
-- * 'ajrqNonce'
data AcknowledgeJob = AcknowledgeJob'
    { _ajrqJobId :: !Text
    , _ajrqNonce :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'AcknowledgeJob' smart constructor.
acknowledgeJob :: Text -> Text -> AcknowledgeJob
acknowledgeJob pJobId_ pNonce_ =
    AcknowledgeJob'
    { _ajrqJobId = pJobId_
    , _ajrqNonce = pNonce_
    }

-- | The unique system-generated ID of the job for which you want to confirm
-- receipt.
ajrqJobId :: Lens' AcknowledgeJob Text
ajrqJobId = lens _ajrqJobId (\ s a -> s{_ajrqJobId = a});

-- | A system-generated random number that AWS CodePipeline uses to ensure
-- that the job is being worked on by only one job worker. This number must
-- be returned in the response.
ajrqNonce :: Lens' AcknowledgeJob Text
ajrqNonce = lens _ajrqNonce (\ s a -> s{_ajrqNonce = a});

instance AWSRequest AcknowledgeJob where
        type Sv AcknowledgeJob = CodePipeline
        type Rs AcknowledgeJob = AcknowledgeJobResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 AcknowledgeJobResponse' <$> (pure (fromEnum s)))

instance ToHeaders AcknowledgeJob where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("CodePipeline_20150709.AcknowledgeJob" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON AcknowledgeJob where
        toJSON AcknowledgeJob'{..}
          = object
              ["jobId" .= _ajrqJobId, "nonce" .= _ajrqNonce]

instance ToPath AcknowledgeJob where
        toPath = const "/"

instance ToQuery AcknowledgeJob where
        toQuery = const mempty

-- | Represents the output of an acknowledge job action.
--
-- /See:/ 'acknowledgeJobResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ajrsStatus'
newtype AcknowledgeJobResponse = AcknowledgeJobResponse'
    { _ajrsStatus :: Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'AcknowledgeJobResponse' smart constructor.
acknowledgeJobResponse :: Int -> AcknowledgeJobResponse
acknowledgeJobResponse pStatus_ =
    AcknowledgeJobResponse'
    { _ajrsStatus = pStatus_
    }

-- | FIXME: Undocumented member.
ajrsStatus :: Lens' AcknowledgeJobResponse Int
ajrsStatus = lens _ajrsStatus (\ s a -> s{_ajrsStatus = a});