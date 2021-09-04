<?php


namespace SentIt\ModelDomain;


class ModelDomain
{

    /**
     * ModelDomain constructor.
     */
    public function __construct(array $data = null)
    {

        if($data != null){
            $this->loadProperties($data);
        }
    }

    protected function loadProperties($data){
        $reflect = new \ReflectionClass($this);
        $props = $reflect->getProperties();

        foreach ($props as $prop){
            $property = $prop->name;
            if(isset($data[$property])){
                $method = $this->toCamelCase("set_".$property);
                $this->$method($data[$property]);
            }
        }
        return $this;
    }

    public function toArray($escapeEmpty = false){
        $arr = array();
        $reflect = new \ReflectionClass($this);
        $props = $reflect->getProperties();
        foreach ($props as $prop){
            $property = $prop->name;
            $method = $this->toCamelCase("get_".$property);
            $value = $this->$method();
            if(!$escapeEmpty || ($escapeEmpty && !empty($value)) ){
                $arr[$property] = $value;
            }
        }
        return $arr;
    }

    protected function toCamelCase($string, $capitalizeFirstCharacter = false){
        $str = str_replace(' ', '', ucwords(str_replace('_', ' ', $string)));

        if (!$capitalizeFirstCharacter) {
            $str[0] = strtolower($str[0]);
        }

        return $str;
    }
}
