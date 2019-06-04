<?php

/**
 * This code was generated by
 * \ / _    _  _|   _  _
 * | (_)\/(_)(_|\/| |(/_  v1.0.0
 * /       /
 */

namespace Twilio\Rest\Serverless\V1\Service;

use Twilio\Options;
use Twilio\Values;

/**
 * PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
 */
abstract class BuildOptions {
    /**
     * @param string $assetVersions List of Asset Version Sids.
     * @param string $functionVersions List of Function Version Sids.
     * @param string $dependencies List of Dependencies.
     * @return CreateBuildOptions Options builder
     */
    public static function create($assetVersions = Values::NONE, $functionVersions = Values::NONE, $dependencies = Values::NONE) {
        return new CreateBuildOptions($assetVersions, $functionVersions, $dependencies);
    }
}

class CreateBuildOptions extends Options {
    /**
     * @param string $assetVersions List of Asset Version Sids.
     * @param string $functionVersions List of Function Version Sids.
     * @param string $dependencies List of Dependencies.
     */
    public function __construct($assetVersions = Values::NONE, $functionVersions = Values::NONE, $dependencies = Values::NONE) {
        $this->options['assetVersions'] = $assetVersions;
        $this->options['functionVersions'] = $functionVersions;
        $this->options['dependencies'] = $dependencies;
    }

    /**
     * The list of Asset Version Sids that are included in this Build. Optional.
     * 
     * @param string $assetVersions List of Asset Version Sids.
     * @return $this Fluent Builder
     */
    public function setAssetVersions($assetVersions) {
        $this->options['assetVersions'] = $assetVersions;
        return $this;
    }

    /**
     * The list of Function Version Sids that are included in this Build. Optional.
     * 
     * @param string $functionVersions List of Function Version Sids.
     * @return $this Fluent Builder
     */
    public function setFunctionVersions($functionVersions) {
        $this->options['functionVersions'] = $functionVersions;
        return $this;
    }

    /**
     * The list of Dependencies that are included in this Build, each described by a `name` and a `version` in a JSON object. Optional.
     * 
     * @param string $dependencies List of Dependencies.
     * @return $this Fluent Builder
     */
    public function setDependencies($dependencies) {
        $this->options['dependencies'] = $dependencies;
        return $this;
    }

    /**
     * Provide a friendly representation
     * 
     * @return string Machine friendly representation
     */
    public function __toString() {
        $options = array();
        foreach ($this->options as $key => $value) {
            if ($value != Values::NONE) {
                $options[] = "$key=$value";
            }
        }
        return '[Twilio.Serverless.V1.CreateBuildOptions ' . implode(' ', $options) . ']';
    }
}