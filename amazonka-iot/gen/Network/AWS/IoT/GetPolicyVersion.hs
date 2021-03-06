{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.IoT.GetPolicyVersion
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Gets information about the specified policy version.
--
--
module Network.AWS.IoT.GetPolicyVersion
    (
    -- * Creating a Request
      getPolicyVersion
    , GetPolicyVersion
    -- * Request Lenses
    , gpvPolicyName
    , gpvPolicyVersionId

    -- * Destructuring the Response
    , getPolicyVersionResponse
    , GetPolicyVersionResponse
    -- * Response Lenses
    , gpvrsPolicyName
    , gpvrsPolicyDocument
    , gpvrsPolicyVersionId
    , gpvrsPolicyARN
    , gpvrsIsDefaultVersion
    , gpvrsResponseStatus
    ) where

import           Network.AWS.IoT.Types
import           Network.AWS.IoT.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | The input for the GetPolicyVersion operation.
--
--
--
-- /See:/ 'getPolicyVersion' smart constructor.
data GetPolicyVersion = GetPolicyVersion'
    { _gpvPolicyName      :: !Text
    , _gpvPolicyVersionId :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'GetPolicyVersion' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gpvPolicyName' - The name of the policy.
--
-- * 'gpvPolicyVersionId' - The policy version ID.
getPolicyVersion
    :: Text -- ^ 'gpvPolicyName'
    -> Text -- ^ 'gpvPolicyVersionId'
    -> GetPolicyVersion
getPolicyVersion pPolicyName_ pPolicyVersionId_ =
    GetPolicyVersion'
    { _gpvPolicyName = pPolicyName_
    , _gpvPolicyVersionId = pPolicyVersionId_
    }

-- | The name of the policy.
gpvPolicyName :: Lens' GetPolicyVersion Text
gpvPolicyName = lens _gpvPolicyName (\ s a -> s{_gpvPolicyName = a});

-- | The policy version ID.
gpvPolicyVersionId :: Lens' GetPolicyVersion Text
gpvPolicyVersionId = lens _gpvPolicyVersionId (\ s a -> s{_gpvPolicyVersionId = a});

instance AWSRequest GetPolicyVersion where
        type Rs GetPolicyVersion = GetPolicyVersionResponse
        request = get ioT
        response
          = receiveJSON
              (\ s h x ->
                 GetPolicyVersionResponse' <$>
                   (x .?> "policyName") <*> (x .?> "policyDocument") <*>
                     (x .?> "policyVersionId")
                     <*> (x .?> "policyArn")
                     <*> (x .?> "isDefaultVersion")
                     <*> (pure (fromEnum s)))

instance Hashable GetPolicyVersion

instance NFData GetPolicyVersion

instance ToHeaders GetPolicyVersion where
        toHeaders = const mempty

instance ToPath GetPolicyVersion where
        toPath GetPolicyVersion'{..}
          = mconcat
              ["/policies/", toBS _gpvPolicyName, "/version/",
               toBS _gpvPolicyVersionId]

instance ToQuery GetPolicyVersion where
        toQuery = const mempty

-- | The output from the GetPolicyVersion operation.
--
--
--
-- /See:/ 'getPolicyVersionResponse' smart constructor.
data GetPolicyVersionResponse = GetPolicyVersionResponse'
    { _gpvrsPolicyName       :: !(Maybe Text)
    , _gpvrsPolicyDocument   :: !(Maybe Text)
    , _gpvrsPolicyVersionId  :: !(Maybe Text)
    , _gpvrsPolicyARN        :: !(Maybe Text)
    , _gpvrsIsDefaultVersion :: !(Maybe Bool)
    , _gpvrsResponseStatus   :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'GetPolicyVersionResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gpvrsPolicyName' - The policy name.
--
-- * 'gpvrsPolicyDocument' - The JSON document that describes the policy.
--
-- * 'gpvrsPolicyVersionId' - The policy version ID.
--
-- * 'gpvrsPolicyARN' - The policy ARN.
--
-- * 'gpvrsIsDefaultVersion' - Specifies whether the policy version is the default.
--
-- * 'gpvrsResponseStatus' - -- | The response status code.
getPolicyVersionResponse
    :: Int -- ^ 'gpvrsResponseStatus'
    -> GetPolicyVersionResponse
getPolicyVersionResponse pResponseStatus_ =
    GetPolicyVersionResponse'
    { _gpvrsPolicyName = Nothing
    , _gpvrsPolicyDocument = Nothing
    , _gpvrsPolicyVersionId = Nothing
    , _gpvrsPolicyARN = Nothing
    , _gpvrsIsDefaultVersion = Nothing
    , _gpvrsResponseStatus = pResponseStatus_
    }

-- | The policy name.
gpvrsPolicyName :: Lens' GetPolicyVersionResponse (Maybe Text)
gpvrsPolicyName = lens _gpvrsPolicyName (\ s a -> s{_gpvrsPolicyName = a});

-- | The JSON document that describes the policy.
gpvrsPolicyDocument :: Lens' GetPolicyVersionResponse (Maybe Text)
gpvrsPolicyDocument = lens _gpvrsPolicyDocument (\ s a -> s{_gpvrsPolicyDocument = a});

-- | The policy version ID.
gpvrsPolicyVersionId :: Lens' GetPolicyVersionResponse (Maybe Text)
gpvrsPolicyVersionId = lens _gpvrsPolicyVersionId (\ s a -> s{_gpvrsPolicyVersionId = a});

-- | The policy ARN.
gpvrsPolicyARN :: Lens' GetPolicyVersionResponse (Maybe Text)
gpvrsPolicyARN = lens _gpvrsPolicyARN (\ s a -> s{_gpvrsPolicyARN = a});

-- | Specifies whether the policy version is the default.
gpvrsIsDefaultVersion :: Lens' GetPolicyVersionResponse (Maybe Bool)
gpvrsIsDefaultVersion = lens _gpvrsIsDefaultVersion (\ s a -> s{_gpvrsIsDefaultVersion = a});

-- | -- | The response status code.
gpvrsResponseStatus :: Lens' GetPolicyVersionResponse Int
gpvrsResponseStatus = lens _gpvrsResponseStatus (\ s a -> s{_gpvrsResponseStatus = a});

instance NFData GetPolicyVersionResponse
