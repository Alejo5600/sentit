<?php


namespace SentIt\Domains\Shipments;


use SentIt\ModelDomain\ModelDomain;

class ShipmentModel extends ModelDomain
{
    protected int $shipment_id = 0;
    protected string $description = "";
    protected ?\DateTime $shipment_date = null;
    protected ?\DateTime $delivery_date = null;
    protected string $start_address = "";
    protected string $arrival_address="";
    protected ?int $state_id = 1;
    protected int $created_by = 0;




    /**
     * @return int
     */
    public function getShipmentId(): ?int
    {
        return $this->shipment_id;
    }

    /**
     * @param int $shipment_id
     */
    public function setShipmentId(int $shipment_id): void
    {
        $this->shipment_id = $shipment_id;
    }

    /**
     * @return string
     */
    public function getDescription(): string
    {
        return $this->description;
    }

    /**
     * @param string $description
     */
    public function setDescription(string $description): void
    {
        $this->description = $description;
    }

    /**
     * @return \DateTime
     */
    public function getShipmentDate(): ?string
    {
        return $this->shipment_date == null? null : $this->shipment_date->format('Y-m-d H:i:s');
    }

    /**
     * @param \DateTime $shipment_date
     */
    public function setShipmentDate(string $shipment_date): void
    {
        $this->shipment_date = new \DateTime($shipment_date);
    }

    /**
     * @return \DateTime
     */
    public function getDeliveryDate(): ?string
    {
        return $this->delivery_date == null ? null : $this->delivery_date->format('Y-m-d H:i:s');
    }

    /**
     * @param \DateTime $delivery_date
     */
    public function setDeliveryDate(string $delivery_date): void
    {
        $this->delivery_date = new \DateTime($delivery_date);
    }

    /**
     * @return string
     */
    public function getStartAddress(): string
    {
        return $this->start_address;
    }

    /**
     * @param string $start_address
     */
    public function setStartAddress(string $start_address): void
    {
        $this->start_address = $start_address;
    }

    /**
     * @return string
     */
    public function getArrivalAddress(): string
    {
        return $this->arrival_address;
    }

    /**
     * @param string $arrival_address
     */
    public function setArrivalAddress(string $arrival_address): void
    {
        $this->arrival_address = $arrival_address;
    }

    /**
     * @return int
     */
    public function getStateId(): ?int
    {
        return $this->state_id;
    }

    /**
     * @param int $state_id
     */
    public function setStateId(?int $state_id): void
    {
        $this->state_id = $state_id;
    }

    /**
     * @return int
     */
    public function getCreatedBy(): int
    {
        return $this->created_by;
    }

    /**
     * @param int $created_by
     */
    public function setCreatedBy(int $created_by): void
    {
        $this->created_by = $created_by;
    }



}
